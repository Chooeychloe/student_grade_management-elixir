defmodule Input do
  alias Validation

  def read_string(prompt) do
    value =
      IO.gets(prompt)
      |> to_string()
      |> String.trim()

    if value == "" do
      IO.puts("Input cannot be empty.")
      read_string(prompt)
    else
      value
    end
  end

  def read_student_id(prompt) do
    id = read_string(prompt)

    if Validation.valid_id?(id) do
      id
    else
      IO.puts("Student ID must be at least 4 characters.")
      read_student_id(prompt)
    end
  end

  def read_student_name(prompt) do
    name = read_string(prompt)

    if Validation.valid_name?(name) do
      name
    else
      IO.puts("Student name cannot be empty.")
      read_student_name(prompt)
    end
  end

  def read_integer(prompt) do
    value =
      IO.gets(prompt)
      |> String.trim()

    case Integer.parse(value) do
      {number, ""} ->
        number

      _ ->
        IO.puts("Please enter a valid integer.")
        read_integer(prompt)
    end
  end

  def read_grade(prompt) do
    grade = read_integer(prompt)

    if Validation.valid_grade?(grade) do
      grade
    else
      IO.puts("Grade must be between 0 and 100.")
      read_grade(prompt)
    end
  end
end
