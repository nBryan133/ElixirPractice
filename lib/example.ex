#class
defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  #function
  def main do
    #declaring variables
    name = "Nate"
    status = Enum.random([:Gold, :Silver, :Bronze, :"no status"])

    #switch statement
    case status do
      :Gold -> IO.puts("Welcome to the fancy lounge, #{name}!")
      :"no status" -> IO.puts("Members only beyond this point")
      _ -> IO.puts("#{status} status members not permitted please upgrade status to continue.")
    end
  end
end
