#class
defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  #function
  def main do
    #strings atoms and comparators
    #declaring variables
    #name = "Nate"
    #status = Enum.random([:Gold, :Silver, :Bronze, :"no status"])

    #switch statement
    #case status do
    #  :Gold -> IO.puts("Welcome to the fancy lounge, #{name}!")
    #  :"no status" -> IO.puts("Members only beyond this point")
    #  _ -> IO.puts("#{status} status members not permitted please upgrade status to continue.")
    #end

    #date and time variables (compound variable examples)
    #time = Time.new!(16, 30, 0, 0)
    #date = Date.new!(2025, 1, 1)
    #date_time = DateTime.new!(date, time, "Etc/UTC")

    #IO.puts(date_time.year)
    #IO.inspect(date_time)

    #example func to tell how much time till new year
    #timeTillNY()


  end

  def timeTillNY do
    time = DateTime.new!(Date.new!(2026, 1, 1), Time.new!(0, 0, 0, 0), "Etc/UTC")
    time_till = DateTime.diff(time, DateTime.utc_now())

    days = div(time_till, 86_400)
    hours = div(rem(time_till, 86_400), 60 * 60)
    minutes = div(rem(time_till, 60 * 60), 60)
    seconds = rem(time_till, 60)

    IO.puts("Till new year: #{days} day(s) #{hours} hour(s) #{minutes} minute(s) #{seconds} second(s)")
  end
end
