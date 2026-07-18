defmodule Storage do
  @filename "students.csv"

  def save_students(students) do
    content =
      students
      |> Enum.map(&student_to_csv/1)
      |> Enum.join("\n")

    case File.write(@filename, content) do
      :ok ->
        IO.puts("Records saved successfully.")

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
    [id, name, math, science, english] =
      String.split(line, ",")

    %Student{
      id: id,
      name: name,
      math: String.to_integer(math),
      science: String.to_integer(science),
      english: String.to_integer(english)
    }
  end
end
