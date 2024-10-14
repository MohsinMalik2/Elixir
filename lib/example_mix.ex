defmodule ExampleMix do
  use Application

  # Importing third party packages into the elixir component
  alias UUID

  # Right way to bind variable as a constant or sort of constant because it can still be updated here but not inside the functions
  @x 5
  # @x 10

  # Atoms are constants whose values are their own name. It's kind of hard coding strings and usefull for conditioning like true false
  # :hello = hello
  # :apple = apple


  def start(_type, _args) do
    # ExampleMix.hello()

    # Describing the main entry point for our Elixir application

    # ExampleMix.randomIDGeneration()

    ExampleMix.main()
    # ExampleMix.newYearTimeLeft()
    # ExampleMix.tuplesUnderstanding()

    # Just to supervise the child function and one_for
    # _one strategy dictate that if a function breaks only restart that particular function. That's what made Elixir Scalable
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def hello do
    IO.puts(:"Hello World")
  end

  def randomIDGeneration do
    IO.puts("Random id = " <> UUID.uuid4())
  end

  def main do

    # To printout the value or string like console.log or printF
    IO.puts(@x)
    name  = "Mohsin"
    status = Enum.random([:gold, :silver, :bronze])

    # if status === :gold do
    #   IO.puts("Welcome to the Club, #{name} #{status}")
    # else
    #   IO.puts("Can't enter #{name}")
    # end

    # case status do
    #   :gold -> IO.puts("Welcome to the Club, #{name} #{status}")
    #   :silver -> IO.puts("Welcome to the Club, #{name} #{status}")
    #   :bronze -> IO.puts("Welcome to the Club, #{name} #{status}")
    #   _ -> IO.puts("Nothing found.")
    # end

    # Excape Characters (To be a part of string)

    # IO.puts("This\nis\na\nmessage");

    # to display code of key "a".
    # IO.puts(?a);

    # Float built-in functions do exist like this ceil
    # IO.puts(Float.ceil(0.5))

    # Integer built-in functions like this gcd
    # IO.puts(Integer.gcd(25, 10))

    time = Time.new!(16, 30, 0, 0)
    date = Date.new!(2025, 1, 1)
    date_time = DateTime.new!(date, time, "Etc/UTC")

    # IO.puts is throwing an error because
    # these compound types variables consists of multiple values so you cannot display them as a single entity
    # IO.puts(time);

    # So for development purposes we can use IO.inspect
    # IO.inspect(time)
    # IO.inspect(date)
    # IO.inspect(date_time)

  end

  def newYearTimeLeft do

    time = DateTime.new!(Date.new!(2025,1,1), Time.new!(0,0,0,0), "Etc/UTC")
    time_till = DateTime.diff(time, DateTime.utc_now())

    # This will print the time in seconds (as is)
    IO.puts("Time in seconds: #{time_till}")

    # Convert to hours
    hours = div(time_till, 3600)
    IO.puts("Time in hours: #{hours}")

    # Convert to days (integer division)
    days = div(time_till, 86400)
    IO.puts("Time in days: #{days}")

    # Convert to months (average month is roughly 30.44 days)
    months = div(time_till, (86400 * 30))
    IO.puts("Time in months (approx.): #{months}")

  end

  # Tuples: Tuples allow us to save multiple values in a single variable.

  def tuplesUnderstanding do

    membership = {:bronze, :silver}
    membership = Tuple.append(membership, :gold)

    IO.inspect(membership)

    prices =  {5, 20, 15}
    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.puts(avg)

    IO.puts("Average price from #{elem(membership, 0)} #{elem(membership, 1)} #{elem(membership, 2)} is #{avg}")

    user1 = {"Mohsin", :gold}
    user2 = {"Hassan", :silver}
    user3 = {"Ahmed", :bronze}

    {name, membership} = user1
    IO.puts("#{name} has a #{membership} membership.")

    {name, membership} = user2
    IO.puts("#{name} has a #{membership} membership.")

    {name, membership} = user3
    IO.puts("#{name} has a #{membership} membership.")

    # Same Program with Each Loop

    users = [
      {"Mohsin", :gold},
      {"Hassan", :silver},
      {"Ahmed", :bronze}
    ]

    Enum.each(users, fn {name, membership} ->  IO.puts("#{name} has a #{membership} membership.") end)

    # Map or Mapping in Elixir. This is a key value pair list where you can have multiple keys
    # that point to some values you can use those keys to look up for it's values. Used in many

    memberships = %{

    }

  end

end
