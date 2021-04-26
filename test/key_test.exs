defmodule KeyTest do
  use ExUnit.Case
  doctest Key

  test "It can create a seed" do
    seed = Key.create_seed

    assert String.length(seed) == 5
  end

  test "It can make A B C D key out of a seed" do

  end
end
