defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """

  @days %{1 => %{"first" => "a Partridge in a Pear Tree.",}, 2 => %{"second" => "two Turtle Doves, and a Partridge in a Pear Tree."},
          3 => %{"third" => "three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."}, 4 => %{"fourth" => "four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."},
          5 => %{"fifth" => "five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."}, 6 => %{"sixth" => "six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."},
          7 => %{ "seventh" => "seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."}, 8 => %{ "eighth" => "eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."},
          9 => %{"ninth" => "nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."}, 10 => %{"tenth" => "ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."},
          11 => %{"eleventh" => "eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."}, 12 => %{"twelfth" => "twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."}}

  @spec verse(number :: integer) :: String.t()
  def verse(number) when number > 0 and number <= 12 do
    get_days_gifts(number)
  end


  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
   for verse <- starting_verse..ending_verse do
    get_days_gifts(verse)
   end
    |> Enum.join("\n")
  end

  defp get_days_gifts(number) do
    days = Map.get(@days, number) |> Map.keys
    gifts = to_string(Map.get(@days, number) |> Map.values)
    "On the #{days} day of Christmas my true love gave to me: #{gifts}"
  end


  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1,12)
  end
end
