defmodule Main do
  use Application

  @impl true
  def start(_type, _args) do
    run()
    {:ok, spawn(fn -> :ok end)}
  end

  def run do
    Menu.start()
  end
end
