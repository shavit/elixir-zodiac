defmodule Zodiac do
  @moduledoc """
  `Zodiac` finds a zodiac sign for a given date.
  """
  defmodule Sign do
    @moduledoc """
    `Sign` defines a zodiac sign
    """


    @typep t :: %__MODULE__{
          name:                   sign_name                       | nil,
          compatible_with:        list(sign_name)                 | nil,
          date_range:             {month_day, month_day}          | nil
        }

    @type month_day ::        {integer(), integer()} | nil

    @type sign_name ::        :capricorn |
                              :aquarius |
                              :pisces |
                              :aries |
                              :taurus |
                              :gemini |
                              :cancer |
                              :leo |
                              :virgo |
                              :libra |
                              :scorpio |
                              :sagittarius

    defstruct [
      name:                   nil,
      compatible_with:        [],
      date_range:             {},
    ]

    @spec new(atom()) :: t
    def new(name) do
      m = %{name: name,
            compatible_with: compatibility(name),
            date_range: get_date_range(name)
          }
      struct(%__MODULE__{}, m)
    end

    @doc """
    Get a list of compatible signs
    """
    @spec compatibility(sign_name) :: list(sign_name)
    def compatibility(name) do
      case name do
        :capricorn -> [:pisces, :scorpio, :virgo, :taurus]
        :aquarius -> [:gemini, :libra]
        :pisces -> [:scorpio, :cancer]
        :aries -> [:aquarius, :sagittarius, :leo, :gemini]
        :taurus -> [:virgo, :pisces]
        :gemini -> [:aquarius, :libra]
        :cancer -> [:scorpio, :pisces]
        :leo -> [:sagittarius, :libra, :gemini, :aries]
        :virgo -> [:taurus, :capricorn]
        :libra -> [:leo, :sagittarius]
        :scorpio -> [:scorpio, :pisces]
        :sagittarius -> [:leo, :aries, :aquarius, :libra]
      end
    end

    @doc """
    Get a range for dates for a sign

    ## Examples

      iex> Zodiac.get_date_range(:capricorn)
      {{12, 22}, {01, 19}}
    """
    @sign_dates %{
      capricorn: {{12, 22}, {01, 19}},
      aquarius: {{01, 20}, {02, 18}},
      pisces: {{02, 20}, {03, 20}},
      aries: {{03, 21}, {04, 19}},
      taurus: {{04, 20}, {05, 20}},
      gemini: {{05, 21}, {06, 20}},
      cancer: {{06, 21}, {07, 22}},
      leo: {{07, 23}, {08, 22}},
      virgo: {{08, 23}, {09, 22}},
      libra: {{09, 23}, {10, 22}},
      scorpio: {{10, 23}, {11, 21}},
      sagittarius: {{11, 22}, {12, 21}}
    }
    @spec get_date_range(sign_name) :: {month_day, month_day}
    def get_date_range(name), do: Map.get(@sign_dates, name)
  end

  @doc """
    Returns the zodiac sign for a given date

    ## Examples

        iex> Zodiac.for_date(~D(1970-12-20))
        %Zodiac.Sign{compatible_with: [:leo, :aries, :aquarius, :libra], date_range: {{11, 22}, {12, 21}}, name: :sagittarius}

  """
  @spec for_date(Date.t) :: Sign.t
  def for_date(d), do: for_date(d.month, d.day)

  @spec for_date(integer(), integer()) :: Sign.t
  defp for_date(1, d), do: Sign.new(if d < 20, do: :capricorn, else: :aquarius)
  defp for_date(2, d), do: Sign.new(if d < 19, do: :aquarius, else: :pisces)
  defp for_date(3, d), do: Sign.new(if d < 21, do: :pisces, else: :aries)
  defp for_date(4, d), do: Sign.new(if d < 20, do: :aries, else: :taurus)
  defp for_date(5, d), do: Sign.new(if d < 21, do: :taurus, else: :gemini)
  defp for_date(6, d), do: Sign.new(if d < 21, do: :gemini, else: :cancer)
  defp for_date(7, d), do: Sign.new(if d < 23, do: :cancer, else: :leo)
  defp for_date(8, d), do: Sign.new(if d < 23, do: :leo, else: :virgo)
  defp for_date(9, d), do: Sign.new(if d < 23, do: :virgo, else: :libra)
  defp for_date(10, d), do: Sign.new(if d < 23, do: :libra, else: :scorpio)
  defp for_date(11, d), do: Sign.new(if d < 22, do: :scorpio, else: :sagittarius)
  defp for_date(12, d), do: Sign.new(if d < 22, do: :sagittarius, else: :capricorn)
end
