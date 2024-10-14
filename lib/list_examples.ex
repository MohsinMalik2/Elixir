defmodule ListExamples do
  alias ElixirLS.LanguageServer
  require Integer
  use Application

  def start(_type, _args) do

    ListExamples.main()

    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    grades = [5, 10, 15, 20]

    new = for n <- grades, do: n + 5
    IO.inspect(new)

    new = new ++ [125]
    new = new ++ [129, 170, 179]
    IO.inspect(new)

    final = [03 | new]

    IO.inspect(final);

    # Conditional Rendering

    even = for n <- final, rem(n, 2) === 0, do: n

    # This means check for every final as n, with remainder 2 is = 0 which is a simplied way of finding even numbers then print out n
    IO.inspect(even)

    even = for n <- final, Integer.is_even(n), do: n
    # This means check for every final as n, is even using built in even integer method then print out n

    IO.inspect(even)

    # FUnctional Programming Concepts
    # In simple words functions within functions to perform some functions

    # numbers = [1,2,3,4]
    # Enum.each(numbers, fn num -> IO.puts(num)  end)

    # In this above example we can see that each is a higher order function as it's using another anonymous function as an argument

    stringNumbers = ["1", "2", "3", "4"]
    IO.inspect(stringNumbers)

    result =  Enum.map(stringNumbers, &String.to_integer/1)
    IO.inspect(result)

    # Using self defined functions numbers_sum and numbers_avg

    IO.inspect(numbers_sum(result))
    IO.inspect(numbers_avg(result))

    getNumbers = get_number_from_user()

    IO.puts("Sum: #{numbers_sum(getNumbers)}, Avg: #{numbers_avg(getNumbers)}")

    # Here & is called capture operator and /1 is simply saying this function will have only one arguments, capture operator use when you try to
    # use an existing function in an argument
  end

  # Self Defined Functions

  def numbers_sum(numbers) do
    sum = Enum.sum(numbers)
  end

  def numbers_avg(numbers) do
    avg = numbers_sum(numbers) / Enum.count(numbers)
  end

  def get_number_from_user do
    user_input = IO.gets("Enter numbers seperated by spaces") |> String.trim()
    String.split(user_input, " ") |> Enum.map(&String.to_integer/1)
  end

end
