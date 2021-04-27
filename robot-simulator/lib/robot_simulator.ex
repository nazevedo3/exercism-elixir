defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """

  defguard is_position(x) when is_integer(x) and is_integer(x)

  defmodule Robot do
    defstruct direction: :north, x: 0, y: 0
  end

  def create(), do: %Robot{}

  def create(direction, _position) when direction not in [:north, :east, :west, :south] do
    {:error, "invalid direction"}
  end

  def create(direction, {x, y}) when is_position(x) == true and is_position(y) == true do
    %Robot{
      direction: direction,
      x: x,
      y: y
    }
  end

  def create(_direction, _position) do
    {:error, "invalid position"}
  end



  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.graphemes
    |> Enum.reduce_while(robot, fn move, robot ->
      case change_direction(robot, move) do
        {:error, _} = error ->
          {:halt, error}
        robot -> {:cont, robot}
      end
    end)
  end

  defp change_direction(%Robot{direction: :north} = robot, "L"), do: %{robot | direction: :west}
  defp change_direction(%Robot{direction: :north} = robot, "R"), do: %{robot | direction: :east}
  defp change_direction(%Robot{direction: :north} = robot, "A"), do: %{robot | y: robot.y + 1}
  defp change_direction(%Robot{direction: :south} = robot, "L"), do: %{robot | direction: :east}
  defp change_direction(%Robot{direction: :south} = robot, "R"), do: %{robot | direction: :west}
  defp change_direction(%Robot{direction: :south} = robot, "A"), do: %{robot | y: robot.y - 1}
  defp change_direction(%Robot{direction: :west} = robot, "L"), do: %{robot | direction: :south}
  defp change_direction(%Robot{direction: :west} = robot, "R"), do: %{robot | direction: :north}
  defp change_direction(%Robot{direction: :west} = robot, "A"), do: %{robot | x: robot.x - 1}
  defp change_direction(%Robot{direction: :east} = robot, "L"), do: %{robot| direction: :north}
  defp change_direction(%Robot{direction: :east} = robot, "R"), do: %{robot | direction: :south}
  defp change_direction(%Robot{direction: :east} = robot, "A"), do: %{robot | x: robot.x + 1}
  defp change_direction(_robot, _instrction), do: {:error, "invalid instruction"}




  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%Robot{direction: dir} = _robot) do
    dir
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%Robot{x: x, y: y} = _robot) do
    {x, y}
  end
end
