defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    case list do
      [first|rest] when is_integer(first) -> [first] ++ FlattenArray.flatten(rest)
      [first|rest] when is_list(first) -> FlattenArray.flatten(first) ++ FlattenArray.flatten(rest)
      [first|rest] -> FlattenArray.flatten(rest)
      [] -> []
    end
  end
end
