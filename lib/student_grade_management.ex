defmodule StudentGradeManagement do
  def main do
    id = Input.read_student_id("Student ID: ")
    name = Input.read_student_name("Student Name: ")

    math = Input.read_grade("Math: ")
    science = Input.read_grade("Science: ")
    english = Input.read_grade("English: ")

    IO.inspect(%{
      id: id,
      name: name,
      math: math,
      science: science,
      english: english
    })
  end
end
