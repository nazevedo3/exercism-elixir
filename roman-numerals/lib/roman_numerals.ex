defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @roman %{
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }


  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    do_numeral(number, "")
  end

  defp do_numeral(number, rn) when number >= 1 and number <= 3000 do
    Enum.map(@roman, fn {k, v} ->
    case number >= k do
      true ->
        do_numeral(number - k, v<>rn)
      false ->
        do_numeral(0, rn)
    end
   end)
   |> List.flatten
   |> List.first
  end

  defp do_numeral(_number, rn), do: rn

end
