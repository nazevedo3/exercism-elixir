defmodule Bob do
  def hey(input) do
    cond do
      is_shout_question?(input) -> "Calm down, I know what I'm doing!"
      is_shout?(input) -> "Whoa, chill out!"
      is_question?(input) -> "Sure."
      is_empty?(input) -> "Fine.  Be that way!"
      true -> "Whatever."
    end
  end


  def is_question?(input) do
    trimmed = trim(input)
    case String.ends_with?(trimmed, "?") do
      true -> true
      false -> false
    end
  end

  def is_shout_question?(input) do
    is_question?(input) && is_shout?(input)
  end

  def is_shout?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end


  def is_empty?(input) do
    trimmed = trim(input)
    cond do
      String.length(trimmed) <= 1 -> true
      true -> false
    end
  end

  defp trim(input) do
    input
    |> String.trim
  end
end
