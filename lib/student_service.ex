defmodule StudentService do
  alias Input
  alias Utils

  def add_student(students) do
    id = Input.read_student_id("Student ID: ")

    if find_student(students, id) != nil do
      IO.puts("Student ID already exists.")
      students
    else
      name = Input.read_student_name("Student Name: ")

      math = Input.read_grade("Math: ")
      science = Input.read_grade("Science: ")
      english = Input.read_grade("English: ")

      student = %Student{
        id: id,
        name: name,
        math: math,
        science: science,
        english: english
      }

      IO.puts("Student added successfully.")

      students ++ [student]
    end
  end

  def view_students([]) do
    IO.puts("No student records found.")
  end

  def view_students(students) do
    Utils.display_header()

    Enum.each(students, fn student ->
      Utils.display_student(student)
    end)
  end

  def find_student(students, id) do
    Enum.find(students, fn student ->
      student.id == id
    end)
  end

  def search_student(students) do
    id = Input.read_student_id("Student ID: ")

    case find_student(students, id) do
      nil ->
        IO.puts("Student not found.")

      student ->
        Utils.display_header()
        Utils.display_student(student)
    end

    students
  end


def update_student(students) do
  id = Input.read_student_id("Enter Student ID to update: ")

  case find_student(students, id) do
    nil ->
      IO.puts("Student not found.")
      students

    _student ->
      IO.puts("\nEnter the new information.")

      name = Input.read_student_name("Student Name: ")
      math = Input.read_grade("Math: ")
      science = Input.read_grade("Science: ")
      english = Input.read_grade("English: ")

      Enum.map(students, fn student ->
        if student.id == id do
          %Student{
            id: id,
            name: name,
            math: math,
            science: science,
            english: english
          }
        else
          student
        end
      end)
  end
end

def delete_student(students) do
  id = Input.read_student_id("Enter Student ID to delete: ")

  case find_student(students, id) do
    nil ->
      IO.puts("Student not found.")
      students

    _student ->
      IO.puts("Student deleted successfully.")

      Enum.reject(students, fn student ->
        student.id == id
      end)
  end
end

end
