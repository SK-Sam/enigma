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

  test "It can create keys by integrating create_seed/1 and get_abcd_keys/1" do
    keys = Key.create_keys

    assert is_map(keys) == true
    assert String.length(keys.a) == 2
    assert String.to_integer(keys.a) < 99 and String.to_integer(keys.a) > 0
    assert String.length(keys.b) == 2
    assert String.to_integer(keys.b) < 99 and String.to_integer(keys.a) > 0
    assert String.length(keys.c) == 2
    assert String.to_integer(keys.c) < 99 and String.to_integer(keys.a) > 0
    assert String.length(keys.d) == 2
    assert String.to_integer(keys.d) < 99 and String.to_integer(keys.a) > 0
  end
end
