# Zodiac

[![Build Status](https://travis-ci.org/shavit/elixir-zodiac.svg?branch=master)](https://travis-ci.org/shavit/elixir-zodiac)

Compatibility between Zodiac Signs. [Documentation](https://hex.pm/packages/zodiac)


## Installation

The package can be installed by adding `zodiac` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:zodiac, "~> 0.1.0"}
  ]
end
```

## Usage


Find compatibility for Leo
```elixir
iex> Sign.compatibility :leo
[:sagittarius, :libra, :gemini, :aries]
```

Find compatibility by date
```elixir
iex> Zodiac.for_date ~D(1970-08-22)
%Sign{
  name: :leo,
  compatible_with: [:sagittarius, :libra, :gemini, :aries]
}
```
