defmodule Univerex.Base do
  @moduledoc """
  Base module for Univerex app
  This module contains implementation of HTTPoison.Base functions
  """
  use HTTPoison.Base

  def full_url(url, params \\ "") do
    url <> params
  end

  def process_url(url) do
    base_url = Application.get_env(:univerex, :base_url)
    base_url <> url
  end

  def process_request_headers(headers) do
    Dict.put headers, :"Accept", "application/json"
  end

  def process_response_body(body) do
    case body do
      "" ->
        nil
      _ ->
        body
        |> Poison.decode!
        |> normalize_data()
    end
  end

  def normalize_data(data) when is_list(data) do
    data
    |> Enum.map(fn hash -> Task.async(fn -> normalize_data(hash) end) end)
    |> Enum.map(&Task.await/1)
  end

  def normalize_data(data) when is_map(data) do
    for {key, val} <- data, into: %{} do
      {String.downcase(key), val}
    end
  end
end