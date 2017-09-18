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

## Configuration

To configure UniverEx you only need to set 5 params in your `congig.exs`:

```
config :univerex,
    base_url: "https://put.your.base.url.here/",
    faculties: "faculties",
    groups: "groups/faculty_id/",
    term: "term/group_id/",
    schedule: "schedule/group_id/"
```

The main thing here is `base_url`.
It concatenates with other `(faculties, groups, term, schedule)` parts then.


## Usage

### Get faculties

```
faculties = Univerex.load_faculties()
```

### Get groups for particular faculty

```
[faculty | _] = faculties
groups = faculty.id |> Univerex.load_groups()
```

### Get current term info for particular group

```
{_faculty_id , [group | _]} = group.id |> Univerex.load_term()
```

### Get current schedule for particular group

```
schedule = group.id |> Univerex.load_schedule()
```

## License

MIT License

Copyright (c) 2017 Nikita Kononenko

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.