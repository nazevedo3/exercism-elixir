defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("212-555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 055-0100")
  "0000000000"

  iex> Phone.number("(212) 555-0100")
  "2125550100"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t()) :: String.t()
   def number(raw) do
    modified = raw |> String.replace(~r/[(" ").+-]/, "") |> String.trim

    cond  do
      String.length(modified) == 11 && String.first(modified) == "1" -> String.replace_prefix(modified, "1", "")
      country_code(modified) ->
        invalid()
      check_length(modified) ->
        invalid()
      contains_letters?(modified) ->
        invalid()
      check_area_code(modified) ->
        invalid()
      check_exchange_code(modified) ->
        invalid()
      true -> modified
    end
  end

  defp country_code(number) do
   cond do
    String.first(number) != "1" && String.length(number) == 11  -> true
    true -> false
   end
  end

  defp check_length(number) do
    cond do
      String.length(number) <= 9 -> true
      true -> false
    end
  end

  defp contains_letters?(number) do
    cond do
      Regex.match?(~r/[a-zA-Z]/, number) -> true
      true -> false
    end
  end

  defp check_area_code(number) do
    cond do
      String.at(number, 0) == "0" || String.at(number, 0) == "1" -> true
      true -> false
    end
  end

  defp check_exchange_code(number) do
    cond do
      String.at(number, 3) == "0" || String.at(number, 3) == "1" -> true
      true -> false
    end

  end
  defp invalid(), do: "0000000000"


  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("212-555-0100")
  "212"

  iex> Phone.area_code("+1 (212) 555-0100")
  "212"

  iex> Phone.area_code("+1 (012) 555-0100")
  "000"

  iex> Phone.area_code("867.5309")
  "000"
  """


  @spec area_code(String.t()) :: String.t()
  def area_code(raw) do
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("212-555-0100")
  "(212) 555-0100"

  iex> Phone.pretty("212-155-0100")
  "(000) 000-0000"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
  end
end
