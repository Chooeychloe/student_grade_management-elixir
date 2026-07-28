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

      IO.puts("")
      IO.puts("Student added successfully!")

      students ++ [student]
    end
  end

  def view_students([]) do
    IO.puts("")
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

  def search_student([]) do
    IO.puts("No student records found.")
    []
  end

  def search_student(students) do
    id = Input.read_student_id("Enter Student ID: ")

    case find_student(students, id) do
      nil ->
        IO.puts("Student not found.")

      student ->
        Utils.display_header()
        Utils.display_student(student)
    end

    students
  end

  def update_student([]) do
    IO.puts("No student records found.")
    []
  end

  def update_student(students) do
    id = Input.read_student_id("Enter Student ID to update: ")

    case find_student(students, id) do
      nil ->
        IO.puts("Student not found.")
        students

      student ->
        IO.puts("")
        IO.puts("Current Student Information")
        Utils.display_header()
        Utils.display_student(student)

        IO.puts("")
        IO.puts("Enter New Information")

        new_name = Input.read_student_name("New Name: ")
        new_math = Input.read_grade("New Math Grade: ")
        new_science = Input.read_grade("New Science Grade: ")
        new_english = Input.read_grade("New English Grade: ")

        updated_students =
          Enum.map(students, fn s ->
            if s.id == id do
              %Student{
                id: id,
                name: new_name,
                math: new_math,
                science: new_science,
                english: new_english
              }
            else
              s
            end
          end)

        IO.puts("")
        IO.puts("Student updated successfully!")

        updated_students
    end
  end

  def delete_student([]) do
    IO.puts("No student records found.")
    []
  end

  def delete_student(students) do
    id = Input.read_student_id("Enter Student ID to delete: ")

    case find_student(students, id) do
      nil ->
        IO.puts("Student not found.")
        students

      student ->
        IO.puts("")
        IO.puts("Student to Delete")
        Utils.display_header()
        Utils.display_student(student)

        IO.puts("")

        answer =
          IO.gets("Delete this student? (Y/N): ")
          |> String.trim()

        if String.downcase(answer) != "y" do
          IO.puts("Deletion cancelled.")
          students
        else
          updated_students =
            Enum.reject(students, fn s ->
              s.id == id
            end)

          IO.puts("")
          IO.puts("Student deleted successfully!")

          updated_students
        end
    end
  end
end
