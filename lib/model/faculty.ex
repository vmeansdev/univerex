defmodule Univerex.Faculty do
  @moduledoc """
  Faculty model
  """
  @derive [Univerex.Converter]
  @fields [:id, :name, :short_name]
  defstruct @fields
end