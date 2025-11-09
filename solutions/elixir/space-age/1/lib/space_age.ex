defmodule SpaceAge do
  @earth_seconds 31557600
  
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
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    val = seconds / @earth_seconds
    cond do
      planet == :mercury -> {:ok, val / 0.2408467}
      planet == :venus -> {:ok, val / 0.61519726}
      planet == :earth -> {:ok, val}
      planet == :mars -> {:ok, val / 1.8808158}
      planet == :jupiter -> {:ok, val / 11.862615}
      planet == :saturn -> {:ok, val / 29.447498}
      planet == :uranus -> {:ok, val / 84.016846}
      planet == :neptune -> {:ok, val / 164.79132}
      true -> {:error, "not a planet"}
    end
  end
end
