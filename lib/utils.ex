defmodule Utils do
  def average(student) do
    (student.math + student.science + student.english) / 3
  end

  def status(student) do
    if average(student) >= 75 do
      "PASS"
    else
      "FAIL"
    end
  end

  def display_header do
    IO.puts("")
    IO.puts("----------------------------------------------------------------------------")

    IO.puts(
      String.pad_trailing("ID", 10) <>
        " " <>
        String.pad_trailing("Name", 20) <>
        " " <>
        String.pad_leading("Math", 6) <>
        " " <>
        String.pad_leading("Sci", 6) <>
        " " <>
        String.pad_leading("Eng", 6) <>
        " " <>
        String.pad_leading("Avg", 8) <>
        " " <>
        String.pad_leading("Status", 8)
    )

    IO.puts("----------------------------------------------------------------------------")
  end

  def display_student(student) do
    IO.puts(
      String.pad_trailing(student.id, 10) <>
        " " <>
        String.pad_trailing(student.name, 20) <>
        " " <>
        String.pad_leading(Integer.to_string(student.math), 6) <>
        " " <>
        String.pad_leading(Integer.to_string(student.science), 6) <>
        " " <>
        String.pad_leading(Integer.to_string(student.english), 6) <>
        " " <>
        String.pad_leading(:erlang.float_to_binary(average(student), decimals: 2), 8) <>
        " " <>
        String.pad_leading(status(student), 8)
    )
  end

  def pause do
    IO.gets("\nPress ENTER to continue...")
  end
end
