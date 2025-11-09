defmodule PaintByNumber do
  defp palette_bit_size(color_count, num) do
    cond do
      2**num >= color_count -> num
      true -> palette_bit_size(color_count, num + 1)
    end
  end

  def palette_bit_size(color_count) do
    palette_bit_size(color_count,1)
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2,3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bits = palette_bit_size(color_count)
    <<rem(pixel_color_index, 2**bits)::size(bits), picture::bitstring>>
  end

  defp _get_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<pixel::size(bits), _rest::bitstring>> = picture
    pixel
  end
  def get_first_pixel(picture, color_count) do
    cond do
      picture == <<>> -> nil
      true -> _get_first_pixel(picture, color_count)
    end
  end

  defp _drop_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<_pixel::size(bits), rest::bitstring>> = picture
    rest
  end
  def drop_first_pixel(picture, color_count) do
    cond do
      picture == <<>> -> <<>>
      true -> _drop_first_pixel(picture, color_count)
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
