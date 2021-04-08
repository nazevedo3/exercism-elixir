defmodule Bob do
  import String, only: [trim: 1]

  def hey(input, mod \\ Millennial) do
    personality = mod.__struct__(
      silence: silence?(input),
      question: question?(input),
      shouting: shout?(input)
    )

    Personality.say(personality)
  end

  defp question?(input) do
    trimmed = trim(input)
    String.ends_with?(trimmed, "?")
  end

  defp shout?(input) do
    String.upcase(input) == input && String.downcase(input) != input
  end


  defp silence?(input) do
    trimmed = trim(input)
    String.length(trimmed) <= 1
  end
end
