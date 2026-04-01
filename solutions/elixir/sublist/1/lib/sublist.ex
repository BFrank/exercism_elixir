defmodule Sublist do
  defp contains?([], _big), do: true
  defp contains?(_small, []), do: false
  defp contains?(small, big = [_head | tail]) do
    List.starts_with?(big, small) or contains?(small, tail)
  end
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      contains?(a,b) -> :sublist
      contains?(b,a) -> :superlist
      true -> :unequal
    end
  end
end
