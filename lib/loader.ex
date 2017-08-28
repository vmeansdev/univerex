defmodule Univerex.Loader do
  @moduledoc """
  Univerex loader module
  """
  alias Univerex.Base

  def init() do
    Base.start()
  end

  def load_collection(key, param \\ nil) do
    case key do
      :faculties ->
        load_faculties
      :groups ->
        load_groups(param)
      :term ->
        load_current_term(param)
      :schedule ->
        load_schedule(param)
      _ ->
        IO.puts "There is no such key"
        nil
    end
  end
  
  defp load(url) do
    Base.get!(url, [], [ ssl: [{:versions, [:'tlsv1.2']}] ]).body
  end
  
  defp load_faculties() do
    Application.get_env(:univerex, :faculties)
    |> Base.full_url()
    |> load()
  end
  
  defp load_groups(faculty_id) do
    Application.get_env(:univerex, :groups)
    |> Base.full_url(faculty_id)
    |> load()
  end

  defp load_current_term(group_id) do
    Application.get_env(:univerex, :current_term)
    |> Base.full_url(group_id)
    |> load()
  end

  defp load_schedule(group_id) do
    Application.get_env(:univerex, :schedule)
    |> Base.full_url(group_id)
    |> load()
  end

end