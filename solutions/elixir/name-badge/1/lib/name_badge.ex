defmodule NameBadge do
  def print(id, name, department) do
    dep = String.upcase(if department, do: department, else: "OWNER")
    if id do 
      "[" <> Integer.to_string(id) <> "] - " <> name <> " - " <> dep
    else
      name <> " - " <> dep
    end
  end
end
