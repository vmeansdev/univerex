defmodule Univerex.Base do
  @moduledoc """
  Base module for Univerex app
  This module contains implementation of HTTPoison.Base functions
  """
  use HTTPoison.Base

  def load(url) do
    __MODULE__.get!(url, [], [ ssl: [{:versions, [:'tlsv1.2']}] ]).body
  end

  def full_url(url),         do: url
  def full_url(url, nil),    do: full_url(url)
  def full_url(url, params), do: url <> params

  def process_url(url) do
    base_url = Application.get_env(:univerex, :base_url)
    base_url <> url
  end

  def process_request_headers(headers) do
    Keyword.put headers, :"Accept", "application/json"
  end

  def process_response_body(""),  do: nil
  def process_response_body(body) do
    body
    |> Poison.decode!
    |> normalize_data()
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