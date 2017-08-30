defmodule Univerex do
  @moduledoc """
  Univerex main api module.
  """
  alias Univerex.Loader
  
  defp load(key, param \\ nil) do
    Loader.load_collection(key, param)
  end

  def load_faculties() do
    load(:faculties)
  end

  def load_groups(faculty_id) do
    groups = load(:groups, faculty_id)
    {faculty_id, groups}
  end

  def load_term(group_id) do
    term = load(:term, group_id)
    {group_id, term}
  end

  def load_schedule(group_id) do
    schedule = load(:schedule, group_id)
    {group_id, schedule}
  end
end
