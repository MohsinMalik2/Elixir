defmodule GuessingGame do
  use Application

  def start(_type, _args) do

    GuessingGame.main()
    Supervisor.start_link([], strategy: :one_for_one)

  end


  def main do

    # :rand is erlang's built in module and as ELixir is based on Erlang it also has that module by default
    
    correctAnswer = :rand.uniform(11) - 1
    IO.puts("Correct answer: " <> Integer.to_string(correctAnswer))

    # Get input from user
    # IO.gets() is like cin>> in Elixir just to get input from user. It has an argument which is actually the prompt or placeholder

    guess = IO.gets("Guess a number between 0 & 10: ") |> String.trim() |> String.to_integer()

    # Compare the guess with the correct answer
    case guess do
      ^correctAnswer -> IO.puts("Your guess is right!")
      _ -> IO.puts("You guessed #{guess}, but the right answer was #{correctAnswer}.")
    end

  end

end
