defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    with three <- three(number),
    five <- five(number),
    seven <- seven(number) do
      case three <> five <> seven do
        "" -> none(number)
        _ -> three <> five <> seven
      end
    end
  end
  defp three(number) do
    case rem(number, 3) do
      0 -> "Pling"
      _ -> ""
    end
  end
  defp five(number) do
    case rem(number, 5) do
      0 -> "Plang"
      _ -> ""
    end
  end
  defp seven(number) do
    case rem(number, 7) do
      0 -> "Plong"
      _ -> ""
    end
  end
  defp none(number), do: Integer.to_string(number)
end
