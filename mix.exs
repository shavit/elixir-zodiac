defmodule Zodiac.MixProject do
  use Mix.Project

  def project do
    [
      app: :zodiac,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      name: "Zodiac",
      description: "Compatibility between Zodiac Signs",
      docs: [
        main: "Zodiac",
        extras: ["README.md"]
      ],
      package: [
        links: %{
          "Github" => "https://github.com/shavit/elixir-zodiac"
        },
        licenses: ["Apache 2.0"],
      ],
      source_url: "https://github.com/shavit/elixir-zodiac",
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
      {:ex_doc, "~> 0.19.3", only: :dev, runtime: false},
    ]
  end
end
