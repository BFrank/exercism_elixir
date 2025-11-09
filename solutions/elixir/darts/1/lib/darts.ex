defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    center_dist = :erlang.abs(:math.sqrt(Float.pow(x * 1.0, 2.0) + Float.pow(y * 1.0, 2.0)))
    cond do
      center_dist <= 1.0 -> 10
      center_dist <= 5.0 -> 5
      center_dist <= 10.0 -> 1
      true -> 0
    end
  end
end
