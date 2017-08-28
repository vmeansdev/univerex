defmodule Univerex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :univerex,
      version: "0.0.1",
      elixir: "~> 1.3",
      start_permanent: Mix.env == :prod,
      deps: deps()
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
      {:poison, "~> 3.1"}
    ]
  end
end
