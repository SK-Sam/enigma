defmodule KeyTest do
  use ExUnit.Case
  doctest Key

  test "It can create a seed" do
    assert String.length(Key.create_seed) == 5
  end
end
