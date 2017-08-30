defmodule Univerex.Group do
  @moduledoc """
  Group model
  """
  @derive [Univerex.Converter]
  @fields [:course_number, :group_name, :group_number, :id, :study_form]
  defstruct @fields
end