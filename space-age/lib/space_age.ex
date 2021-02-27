defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth = _planet, seconds),  do: seconds / 31557600
  def age_on(:mercury = _plant, seconds), do: (seconds / 31557600 ) / 0.2408467
  def age_on(:venus = _planet, seconds), do: (seconds / 31557600 ) / 0.61519726
  def age_on(:mars = _planet, seconds), do: (seconds / 31557600 ) / 1.8808158
  def age_on(:jupiter = _planet, seconds), do: (seconds / 31557600 ) / 11.862615
  def age_on(:saturn = _planet, seconds), do:  (seconds / 31557600 ) / 29.447498
  def age_on(:uranus = _planet, seconds), do: (seconds / 31557600 ) / 84.016846
  def age_on(:neptune = _planet, seconds), do: (seconds / 31557600 ) / 164.79132
end
