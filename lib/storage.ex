defmodule Storage do
  @filename "students.csv"

  def save_students(students) do
    content =
      students
      |> Enum.map(&student_to_csv/1)
      |> Enum.map(&(&1 <> "\n"))
      |> Enum.join("")

    case File.write(@filename, content) do
      :ok ->
        IO.puts("Students saved successfully.")

      {:error, reason} ->
        IO.puts("Failed to save records: #{inspect(reason)}")
    end
  end

  def load_students do
    if File.exists?(@filename) do
      @filename
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.map(&csv_to_student/1)
      |> Enum.reject(&is_nil/1)
    else
      []
    end
  end

  defp student_to_csv(student) do
    Enum.join(
      [
        student.id,
        student.name,
        Integer.to_string(student.math),
        Integer.to_string(student.science),
        Integer.to_string(student.english)
      ],
      ","
    )
  end

  defp csv_to_student(line) do
    case String.split(line, ",") do
      [id, name, math, science, english] ->
        %Student{
          id: id,
          name: name,
          math: String.to_integer(math),
          science: String.to_integer(science),
          english: String.to_integer(english)
        }

      _ ->
        nil
    end
  end
end
