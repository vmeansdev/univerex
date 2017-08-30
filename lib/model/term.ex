defmodule Univerex.Term do
  @moduledoc """
  Term model
  """
  @derive [Univerex.Converter]
  @fields [:begin_date, :change_date, :end_date, :term_number, :term_part]
  defstruct @fields
end