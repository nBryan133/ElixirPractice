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
    #mapFun()

  #process to play a simple guessing game
    #generates a random number from 1 - 10
    #answer = :rand.uniform(10)

    #gets user input from the getGuess function
    #guess = getGuess()

    #calls process
    #guessingGame(answer, guess)

  #messing with lists
    listFun()

  end

  #process for messing with lists
  def listFun do
    #init a list called grades
    grades = [25, 50, 75, 100]

    IO.puts("List of grades:")
    #iterate through and print contents of list to Terminal
    for n <- grades, do: IO.puts(n)
    IO.puts("\nNew list of grades:")

    #generates new list by adding 5 to each of grades values then prints it
    new = for n <- grades, do: n + 5
    for n <- new, do: IO.puts(n)

    #appending new values to end of new List
    IO.puts("\nNew list of grades:")
    new = new ++ [125]
    new = new ++ [150, 175]
    for n <- new, do: IO.puts(n)

    #making final list with new value at beginning followed by the contents of new list
    IO.puts("\nFinal list of grades:")
    final = [5 | new]
    for n <- final, do: IO.puts(n)

    #making list of even values in final list
    IO.puts("\nEven values in list:")
    even = for n <- final, rem(n, 2) == 0, do: n
    for n <- even, do: IO.puts(n)

  end

  #process to get a guess that is within a set of rules
  def getGuess do
    # prompts a user to input a guess for what the number is
    guess = IO.gets("Guess a number from 1 - 10\n")

    #checks whether the user input is valid and whether the environment the program
    #is running is allows this kind of operation
    case guess do

      #if an error is thrown
      {:error, _} ->
        IO.puts("input not supported in this environment")
        exit(:normal)

      #if the program recieved no input whatsoever
      nil ->
        IO.puts("No input received try again")
        getGuess()

      #if input was recieved
      input ->
        #trims the input of all leading and trailing whitespaces in the input
        trimmed = String.trim(input)

        #checks if the trimmed input, when converted into an
        #integer, is within the range 1-10
        case Integer.parse(trimmed) do

          #when the number is within the range
          {num, ""} when num >= 1 and num <= 10 ->
            #return the number
            num

          #if number is not within that range
          _ ->
            #tell user input is out of range then recurse
            IO.puts("Input out of range\n")
            getGuess()
        end
    end

  end

  #process that has the user try to guess a randomly generated number over multiple rounds
  def guessingGame(answer, guess) do

    #switch statement equivalent that will go recursive if user guessed wrong.
    case guess do

      #if guess is the same as the answer
      ^answer ->

        #tell user they got the right number then end process
        IO.puts("\nThe number was #{guess}!")
        :ok

      #if the guess is less than the answer
      guess when guess < answer ->

        IO.puts("Higher")   #tell user that they need to go higher
        guess = getGuess()  #get new guess
        guessingGame(answer, guess) #recurse process passing new guess

      #if the guess is greater than the answer
      guess when guess > answer ->

        IO.puts("Lower")    #tell the user they need to go lower
        guess = getGuess()  #get new guess
        guessingGame(answer, guess) #recurs process passing new guess

      end
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
