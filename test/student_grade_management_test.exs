defmodule StudentGradeManagementTest do
  use ExUnit.Case
  doctest StudentGradeManagement

  test "greets the world" do
    assert StudentGradeManagement.hello() == :world
  end
end
