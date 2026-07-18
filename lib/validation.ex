defmodule Validation do

  def valid_name?(name) do
    String.trim(name) != ""
  end

  def valid_id?(id) do
    String.length(String.trim(id)) >= 4
  end

  def valid_grade?(grade)
      when is_integer(grade) and grade >= 0 and grade <= 100 do
    true
  end

  def valid_grade?(_) do
    false
  end

  def valid_grades?(math, science, english) do
    valid_grade?(math) and
      valid_grade?(science) and
      valid_grade?(english)
  end

  def valid_menu_choice?(choice) do
    choice in ["1", "2", "3", "4", "5", "6", "7", "8"]
  end

end
