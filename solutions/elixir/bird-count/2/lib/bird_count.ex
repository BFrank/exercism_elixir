defmodule BirdCount do
  
  def today(list) do
    cond do
      length(list) == 0 -> nil
      true -> hd(list)
    end
  end

  def increment_day_count(list) do
    cond do
      length(list) == 0 -> [1]
      true -> [hd(list) + 1 | tl(list)]
    end
  end

  def has_day_without_birds?(list) do
    :lists.any(&(&1 == 0), list)
  end

  def total(list) do
    :lists.sum(list)
  end

  defp count([]), do: 0
  defp count(list) do
    cond do
      hd(list) >= 5 -> 1 + count(tl(list))
      true -> count(tl(list))
    end
  end
  
  def busy_days(list) do
    count(list)
  end
end
