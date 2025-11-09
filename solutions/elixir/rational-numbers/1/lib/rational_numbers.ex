defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {a_num, a_den} = a
    {b_num, b_den} = b
    x = a_num * b_den + b_num * a_den
    y = a_den * b_den
    reduce({x, y})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {a_num, a_den} = a
    {b_num, b_den} = b
    x = a_num * b_den - b_num * a_den
    y = a_den * b_den
    reduce({x, y})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {a_num, a_den} = a
    {b_num, b_den} = b
    x = a_num * b_num
    y = a_den * b_den
    reduce({x, y})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {a_num, a_den} = num
    {b_num, b_den} = den
    x = a_num * b_den
    y = a_den * b_num
    reduce({x, y})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {a_num, a_den} = a
    reduce({Kernel.abs(a_num), Kernel.abs(a_den)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {a_num, a_den} = a
    cond do
      n >= 0 -> reduce({Integer.pow(a_num, n), Integer.pow(a_den, n)})
      true -> reduce({Integer.pow(a_den, n * -1), Integer.pow(a_num, n * -1)})
    end
  end

  @doc """
  i-th root of f
  """
  defp root(f, i) do
    Float.pow(f, 1.0 / i)
  end
  
  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: float, n :: rational) :: float
  def pow_real(x, n) do
    {n_num, n_den} = n
    root(Float.pow(x * 1.0, n_num), n_den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {a1, a2} = a |> IO.inspect()
    gcd = Integer.gcd(a1, a2)
    num = div(a1, gcd)
    den = div(a2, gcd)
    cond do
      den > 0 -> {num, den}
      den == 0 -> {0, 1}
      true -> {num * -1, den * -1}
    end
  end
end
