defmodule Bob do
  import String, only: [trim: 1]

  def hey(input) do
    cond do
      shout_question?(input) -> "Calm down, I know what I'm doing!"
      shout?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      empty?(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp question?(input) do
    trimmed = trim(input)
    String.ends_with?(trimmed, "?")
  end

  defp shout_question?(input) do
    question?(input) && shout?(input)
  end

  defp shout?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end


  defp empty?(input) do
    trimmed = trim(input)
    String.length(trimmed) <= 1
  end
end
