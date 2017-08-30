defmodule Univerex.Loader do
  @moduledoc """
  Univerex loader module
  """
  alias Univerex.{Base, Faculty, Group, Term, Schedule}

  def init() do
    Base.start()
  end

  def load_collection(key, param \\ nil) do
    Application.get_env(:univerex, key)
    |> Base.full_url(param)
    |> Base.load()
    |> map_data(key)
  end
    
  defp map_data(data, key) when is_list(data) do
    case key do
      :faculties -> map_to_struct(Faculty, data)
      :groups    -> map_to_struct(Group, data)
      :schedule  -> map_to_struct(Schedule, data)
      _          -> nil
    end
  end

  defp map_data(data, _key) when is_nil(data), do: nil

  defp map_data(data, key) when is_map(data) do
    case key do
      :term -> struct(Term, data)
      _     -> nil
    end
  end

  defp map_to_struct(type, data) do
    data
    |> Enum.map(&Task.async(fn -> struct(type, &1) end))
    |> Enum.map(&Task.await/1)
  end
end