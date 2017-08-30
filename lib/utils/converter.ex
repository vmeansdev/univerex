defprotocol Univerex.Converter do
  def to_raw_map(struct)
  def to_univerex_struct(foreign_struct)
end

defimpl Univerex.Converter, for: Any do
  def to_raw_map(struct) do
    map  = Map.from_struct(struct)
    vals = Map.values(map)
    keys = Map.keys(map)

    keys
    |> Enum.map(&Recase.to_pascal(Atom.to_string(&1)))
    |> Enum.zip(vals)
    |> Enum.into(%{})
  end

  def to_univerex_struct(_foreign_struct), do: nil
end