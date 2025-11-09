defmodule SquareRoot do
  defp next(r, x) do
    (x + (r / x) ) / 2
  end

  defp approx(r, guess) do
    cond do
      guess * guess == r -> guess
      true -> approx(r, next(r, guess)) 
    end
  end
  
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) when is_integer(radicand) and radicand > 0  do
    guess = div(radicand, 2)
    cond do
      radicand - guess > 1 -> approx(radicand, guess)
      true -> radicand
    end
  end
end
