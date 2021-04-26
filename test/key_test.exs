defmodule KeyTest do
  use ExUnit.Case
  doctest Key

  test "It can create a seed" do
    seed = Key.create_seed

    assert String.length(seed) == 5
  end

  test "It can make A B C D key out of a seed" do
    seed = "01234"
    abcd_keys = Key.get_abcd_keys(seed)

    expected = %Key{a: "01", b: "12", c: "23", d: "34"}
    assert abcd_keys === expected
  end
end
