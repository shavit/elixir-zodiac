defmodule ZodiacTest do
  use ExUnit.Case
  doctest Zodiac

  alias Zodiac
  alias Zodiac.Sign

  describe "zodiac" do

    test "for_date/1 returns the zodiac sign for a given date" do
      assert %Sign{name: :capricorn} = Zodiac.for_date ~D(1970-12-22)
      assert %Sign{name: :capricorn} = Zodiac.for_date ~D(1970-01-19)
      assert %Sign{name: :aquarius} = Zodiac.for_date ~D(1970-01-20)
      assert %Sign{name: :aquarius} = Zodiac.for_date ~D(1970-02-18)
      assert %Sign{name: :pisces} = Zodiac.for_date ~D(1970-02-19)
      assert %Sign{name: :pisces} = Zodiac.for_date ~D(1970-03-20)
      assert %Sign{name: :aries} = Zodiac.for_date ~D(1970-03-21)
      assert %Sign{name: :aries} = Zodiac.for_date ~D(1970-04-19)
      assert %Sign{name: :taurus} = Zodiac.for_date ~D(1970-04-20)
      assert %Sign{name: :taurus} = Zodiac.for_date ~D(1970-05-20)
      assert %Sign{name: :gemini} = Zodiac.for_date ~D(1970-05-21)
      assert %Sign{name: :gemini} = Zodiac.for_date ~D(1970-06-20)
      assert %Sign{name: :cancer} = Zodiac.for_date ~D(1970-06-21)
      assert %Sign{name: :cancer} = Zodiac.for_date ~D(1970-07-22)
      assert %Sign{name: :leo} = Zodiac.for_date ~D(1970-07-23)
      assert %Sign{name: :leo} = Zodiac.for_date ~D(1970-08-22)
      assert %Sign{name: :virgo} = Zodiac.for_date ~D(1970-08-23)
      assert %Sign{name: :virgo} = Zodiac.for_date ~D(1970-09-22)
      assert %Sign{name: :libra} = Zodiac.for_date ~D(1970-09-23)
      assert %Sign{name: :libra} = Zodiac.for_date ~D(1970-10-22)
      assert %Sign{name: :scorpio} = Zodiac.for_date ~D(1970-10-23)
      assert %Sign{name: :scorpio} = Zodiac.for_date ~D(1970-11-21)
      assert %Sign{name: :sagittarius} = Zodiac.for_date ~D(1970-11-22)
      assert %Sign{name: :sagittarius} = Zodiac.for_date ~D(1970-12-21)
    end
  end

  describe "zodiac sign" do

    test "compatibility/1 returns a list of matched signs" do
      assert [:pisces, :scorpio, :virgo, :taurus] == Sign.compatibility :capricorn
    end

    test "get_date_range/1 returns the dates for a sign" do
      assert {{12, 22}, {1, 19}} = Sign.get_date_range :capricorn
      assert {{1, 20}, {2, 18}} = Sign.get_date_range :aquarius
      assert {{2, 20}, {3, 20}} = Sign.get_date_range :pisces
      assert {{3, 21}, {4, 19}} = Sign.get_date_range :aries
      assert {{4, 20}, {5, 20}} = Sign.get_date_range :taurus
      assert {{5, 21}, {6, 20}} = Sign.get_date_range :gemini
      assert {{6, 21}, {7, 22}} = Sign.get_date_range :cancer
      assert {{7, 23}, {8, 22}} = Sign.get_date_range :leo
      assert {{8, 23}, {9, 22}} = Sign.get_date_range :virgo
      assert {{9, 23}, {10, 22}} = Sign.get_date_range :libra
      assert {{10, 23}, {11, 21}} = Sign.get_date_range :scorpio
      assert {{11, 22}, {12, 21}} = Sign.get_date_range :sagittarius
    end
  end
end
