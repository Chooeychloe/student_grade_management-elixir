defmodule Menu do
  alias StudentService
  alias Storage
  alias Utils

  def show_menu do
    IO.puts("")
    IO.puts("========================================")
    IO.puts(" Student Grade Management System")
    IO.puts("========================================")
    IO.puts("1. Add Student")
    IO.puts("2. View Students")
    IO.puts("3. Search Student")
    IO.puts("4. Update Student")
    IO.puts("5. Delete Student")
    IO.puts("6. Save Records")
    IO.puts("7. Load Records")
    IO.puts("8. Exit")
    IO.puts("========================================")
  end

  def start do
    students = Storage.load_students()
    loop(students)
  end

  defp loop(students) do
    show_menu()

    choice =
      IO.gets("Enter your choice: ")
      |> String.trim()

    case choice do
      "1" ->
        students = StudentService.add_student(students)
        Utils.pause()
        loop(students)

      "2" ->
        StudentService.view_students(students)
        Utils.pause()
        loop(students)

      "3" ->
        StudentService.search_student(students)
        Utils.pause()
        loop(students)

      "4" ->
        students = StudentService.update_student(students)
        Utils.pause()
        loop(students)

      "5" ->
        students = StudentService.delete_student(students)
        Utils.pause()
        loop(students)

      "6" ->
        Storage.save_students(students)
        Utils.pause()
        loop(students)

      "7" ->
        students = Storage.load_students()
        Utils.pause()
        loop(students)

      "8" ->
        Storage.save_students(students)
        IO.puts("Goodbye!")

      _ ->
        IO.puts("Invalid menu choice.")
        Utils.pause()
        loop(students)
    end
  end
end
