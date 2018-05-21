defmodule Absinthe.Plug.Mixfile do
  use Mix.Project

  @version "2.0.0"

  def project do
    [
      app: :absinthe_plug,
      version: @version,
      elixir: "~> 1.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      docs: [source_ref: "v#{@version}", main: "Absinthe.Plug"],
      deps: deps()
    ]
  end

  defp package do
    [
      description: "Plug support for Absinthe, the GraphQL toolkit for Elixir",
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Ben Wilson", "Bruce Williams"],
      originzation: "peatio",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/peatio/absinthe_plug.git"}
    ]
  end

  def application do
    [applications: [:logger, :plug, :absinthe]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:plug, "~> 1.3.2 or ~> 1.4"},
      {:absinthe, "~> 2.1.5", organization: "peatio"},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:ex_doc, "~> 0.18.0", only: :dev}
    ]
  end
end
