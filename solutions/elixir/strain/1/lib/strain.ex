defmodule Strain do
  defp apply_cond(_,[],_check), do: []
  defp apply_cond(fun, _list=[head|tail], check) do
    case fun.(head) do 
      # Match against the value currently held in check, don't reassign it
      ^check -> [head | apply_cond(fun, tail, check)]
      _ -> apply_cond(fun, tail, check)
    end
  end
  
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    apply_cond(fun, list, true)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    apply_cond(fun, list, false)
  end
end
