defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

#Module(class equivalent)
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

    #example process to tell how much time till new year
    #timeTillNY()

    #example process to learn about tuples
    #tupleFun()

    #example process to learn about maps
    mapFun()

  end

  #process(function) to learn how maps work
  def mapFun do
    #map of membership tiers and their prices made through a module
    gold_membership = %Membership{type: :gold, price: 25}
    silver_membership = %Membership{type: :silver, price: 20}
    bronze_membership = %Membership{type: :bronze, price: 15}
    none_membership = %Membership{type: :null, price: 0}

    #tuple of users and their membership tiers
    users = [
      %User{name: "Nate", membership: gold_membership},
      %User{name: "Morgan", membership: gold_membership},
      %User{name: "Mike", membership: silver_membership},
      %User{name: "John", membership: bronze_membership},
      %User{name: "Jerry", membership: none_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} has a #{membership.type} membership paying #{membership.price}.")
    end)

  end

  #process(function) to learn how tuples work
  def tupleFun do
    memberships = {:bronze, :silver}
    memberships = Tuple.insert_at(memberships, tuple_size(memberships), :gold)
    IO.inspect(memberships)

    prices = {5, 10, 15}
    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.puts(avg)

    IO.puts(
      "Average price form #{elem(memberships, 0)} #{elem(memberships, 1)} #{elem(memberships, 2)} is #{avg}"
    )

    #tuple of users and their membership tiers
    users = [
      {"Nate", :gold},
      {"Morgan", :gold},
      {"Mike", :silver},
      {"Andy", :bronze}
    ]

    #for loop equivalent
    Enum.each(users, fn{name, membership} ->
      IO.puts("#{name} has a #{membership} membership")
    end)

  end

  #process (function) to get time till new year
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
