defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:cup, value}) do {:milliliter, value * 240} end
  def to_milliliter({:fluid_ounce, value}) do {:milliliter, value * 30} end
  def to_milliliter({:teaspoon, value}) do {:milliliter, value * 5} end
  def to_milliliter({:tablespoon, value}) do {:milliliter, value * 15} end
  def to_milliliter({:milliliter, value}) do {:milliliter, value * 1} end
  

  def from_milliliter(volume_pair, :cup) do {:cup, get_volume(volume_pair) / 240} end
  def from_milliliter(volume_pair, :fluid_ounce) do {:fluid_ounce, get_volume(volume_pair) / 30} end
  def from_milliliter(volume_pair, :teaspoon) do {:teaspoon, get_volume(volume_pair) / 5} end
  def from_milliliter(volume_pair, :tablespoon) do {:tablespoon, get_volume(volume_pair) / 15} end
  def from_milliliter(volume_pair, :milliliter) do {:milliliter, get_volume(volume_pair) / 1} end
  
  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
