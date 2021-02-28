defmodule ResistorColor do
  @moduledoc false
  @resistor_colors %{
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }

  @spec colors() :: list(String.t())
  def colors do
    Map.to_list(@resistor_colors)
    |> Enum.sort(fn {_key1, value1}, {_key2, value2} -> value1 < value2 end)
    |> Enum.map(fn {key, _value} -> key end)
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    Map.get(@resistor_colors, color)
  end
end
