defmodule ExampleMixTest do
  use ExUnit.Case
  doctest ExampleMix

  test "greets the world" do
    assert ExampleMix.hello() == :world
  end
end
