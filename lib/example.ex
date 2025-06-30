defmodule Example do
  use Application
  alias UUID
  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    IO.puts(:world)
  end
end
