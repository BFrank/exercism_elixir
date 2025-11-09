defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.first(String.trim(name))
  end

  def initial(name) do
    String.upcase(HighSchoolSweetheart.first_letter(name)) <>"."
  end

  def initials(full_name) do
    [f, l] = String.split(full_name)
    "#{HighSchoolSweetheart.initial(f)} #{HighSchoolSweetheart.initial(l)}"
  end

  def pair(full_name1, full_name2) do
    """ 
    ❤-------------------❤
    |  #{HighSchoolSweetheart.initials(full_name1)}  +  #{HighSchoolSweetheart.initials(full_name2)}  |
    ❤-------------------❤
    """
  end
end
