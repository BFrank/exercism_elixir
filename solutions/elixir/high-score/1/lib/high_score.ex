defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.update(scores, name, 0, fn _x -> 0 end)
  end

  def update_score(scores, name, score) do
    cond do
      Map.has_key?(scores, name) -> Map.update(scores, name, 0, fn x -> x + score end)
      true -> Map.put(scores, name, score)
    end
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
