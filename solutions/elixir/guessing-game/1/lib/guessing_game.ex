defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  def compare(secret_number, guess) do
    cond do
      guess == :no_guess -> "Make a guess"
      guess == secret_number -> "Correct"
      guess == secret_number + 1 or guess == secret_number - 1 -> "So close"
      guess > secret_number -> "Too high"
      guess < secret_number -> "Too low"
      true -> false
    end
  end

  
end
