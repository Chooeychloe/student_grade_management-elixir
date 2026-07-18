defmodule Student do
  @moduledoc """
  Represents a student record.
  """

  defstruct [
    :id,
    :name,
    :math,
    :science,
    :english
  ]
end
