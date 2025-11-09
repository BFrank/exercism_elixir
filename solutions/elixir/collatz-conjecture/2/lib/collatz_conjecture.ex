defmodule CollatzConjecture do
  defp next(num, acc) when num == 1 do
    acc
  end
  defp next(num, acc) when rem(num, 2) == 1 do
    next(num * 3 + 1, acc + 1)
  end
  defp next(num, acc) when rem(num, 2) == 0 do
    next(div(num , 2), acc + 1)
  end

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 do
    next(input, 0)  
  end
end
