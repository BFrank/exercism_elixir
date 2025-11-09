defmodule DNA do
  def encode_nucleotide(code_point) do
    cond do
      code_point == ?\s -> 0
      code_point == ?A -> 1
      code_point == ?C -> 2
      code_point == ?G -> 4
      code_point == ?T -> 8
      true -> :error
    end
  end

  def decode_nucleotide(encoded_code) do
    cond do
      encoded_code == 0 -> ?\s
      encoded_code == 1 -> ?A
      encoded_code == 2 -> ?C
      encoded_code == 4 -> ?G
      encoded_code == 8 -> ?T
      true -> :error
    end
  end

  
  def encode(dna) do
    do_encode(dna, <<>>)
  end
  
  defp do_encode([], acc) do
    acc
  end
  
  defp do_encode([head | tail], acc) do
    do_encode(tail, <<acc :: bitstring, encode_nucleotide(head) :: size(4)>>)
  end

  def decode(dna) do
    reverse(do_decode(dna, ~c""))
  end
  
  defp do_decode(<<>>, acc) do
    acc
  end
  
  defp do_decode(dna, acc) do
    <<first::size(4), rest::bitstring>> = dna 
    acc = [decode_nucleotide(first) | acc]
    cond do
      rest == <<>> -> acc
      true -> do_decode(rest, acc)
    end
  end

  defp reverse(chl) do
    do_reverse(chl, ~c"")
  end

  defp do_reverse([], acc) do
    acc
  end

  defp do_reverse([head | tail], acc) do
    do_reverse(tail, [head | acc] )
  end
end
