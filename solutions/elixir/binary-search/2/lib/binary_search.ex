defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) when is_tuple(numbers) do
    search(numbers, key, 0 , tuple_size(numbers))  
  end  

 defp search(numbers, key, from, to) do
   mid = div(to - from , 2) + from 
   cond do
     tuple_size(numbers) == 0 -> :not_found
     key > elem(numbers,tuple_size(numbers)-1) -> :not_found
     elem(numbers, mid) == key -> {:ok, mid}
     from == to -> :not_found
     elem(numbers, mid) < key -> search(numbers, key, mid + 1, to)
     elem(numbers, mid) > key -> search(numbers, key, from, mid - 1)
   end
 end
  
  
end
