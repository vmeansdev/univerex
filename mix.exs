defmodule Univerex.Mixfile do
  use Mix.Project

  @version "0.0.1"
  @url "https://github.com/vmeansdev/univerex"

  def project do
    [
      app: :univerex,
      version: @version,
      elixir: "~> 1.3",
      description: "UniverEx is a library for loading university study plan."
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      name: "UniverEx",
      source_url: @url,
      homepage_url: @url
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:recase, "~> 0.2"}
    ]
  end

  defp package do
    [files: ~w(lib mix.exs README.md LICENSE.md),
     maintainers: ["Nikita Kononenko"],
     licenses: ["MIT"],
     links: %{"GitHub" => @url}]
  end
end
