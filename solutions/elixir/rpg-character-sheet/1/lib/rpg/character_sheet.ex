defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    String.trim(IO.gets("What is your character's name?\n"))
  end

  def ask_class() do
    String.trim(IO.gets("What is your character's class?\n"))
  end

  def ask_level() do
    String.to_integer(String.trim(IO.gets("What is your character's level?\n")))
  end

  def run() do
    
    RPG.CharacterSheet.welcome()
    Map.new() 
    |> Map.put(:name, RPG.CharacterSheet.ask_name())
    |> Map.put(:class, RPG.CharacterSheet.ask_class())
    |> Map.put(:level, RPG.CharacterSheet.ask_level())
    |> IO.inspect(label: "Your character")
  end
end
