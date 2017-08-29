# UniverEx

UniverEx is a library for loading university study plan.
It contains convenient structs to work with (Faculty, Group, Term, Schedule).

Under the hood UniverEx uses HTTPoison and Poison to download and parse JSON data respectively.

Actual purpose of this library is personal use only, but you may also find it useful and helpful ;)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `univerex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:univerex, "~> 0.0.1"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/univerex](https://hexdocs.pm/univerex).

