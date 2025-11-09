defmodule ResistorColorTrio do
  @color_map %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9,
  }
  
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    tmp = Integer.undigits([@color_map[Enum.at(colors,0)], @color_map[Enum.at(colors,1)]])
    val = tmp * Integer.pow(10, @color_map[Enum.at(colors,2)])
    cond do 
      val > 1000000000 -> {div(val, 1000000000), :gigaohms}
      val > 1000000 -> {div(val, 1000000), :megaohms}
      val > 1000 -> {div(val, 1000), :kiloohms}
      true -> {val, :ohms}
    end
  end
end
