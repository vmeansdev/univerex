defmodule Univerex.Base do
  @moduledoc """
  Base module for Univerex app
  This module contains implementation of HTTPoison.Base functions
  """
  use HTTPoison.Base

  def load(url) do
    __MODULE__.get!(url, [], [ ssl: [{:versions, [:'tlsv1.2']}] ]).body
  end

  def full_url(url, params \\ "") do
    cond do
      is_nil(params) -> url
      true -> url <> params
    end
  end

  def process_url(url) do
    base_url = Application.get_env(:univerex, :base_url)
    base_url <> url
  end

  def process_request_headers(headers) do
    Keyword.put headers, :"Accept", "application/json"
  end

  def process_response_body(body) do
    case body do
      "" ->
        nil
      _  ->
        body
        |> Poison.decode!
        |> normalize_data()
    end
  end

  def normalize_data(data) when is_list(data) do
    data
    |> Enum.map(&Task.async(fn -> normalize_data(&1) end))
    |> Enum.map(&Task.await/1)
  end

  def normalize_data(data) when is_map(data) do
    for {key, val} <- data, into: %{} do
      key_transformed =
        key
        |> Recase.to_snake()
        |> String.to_atom()
      {key_transformed, val}
    end
  end
end