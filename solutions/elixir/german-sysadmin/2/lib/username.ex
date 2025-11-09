defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    
    case username  do
      [] -> []
      [first_letter | rest_name] when first_letter == ?ä -> [?a,?e | Username.sanitize(rest_name)]
      [first_letter | rest_name] when first_letter == ?ö -> [?o,?e | Username.sanitize(rest_name)]
      [first_letter | rest_name] when first_letter == ?ü -> [?u,?e | Username.sanitize(rest_name)]
      [first_letter | rest_name] when first_letter == ?ß -> [?s,?s | Username.sanitize(rest_name)]
      [first_letter | rest_name] when first_letter >= ?a and first_letter <= ?z or first_letter == ?_ -> [first_letter | Username.sanitize(rest_name)]
      [_first_letter | rest_name] -> Username.sanitize(rest_name)
    end
  end
end
