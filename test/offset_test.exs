defmodule OffsetTest do
  use ExUnit.Case
  doctest Offset

  test "It can square a string date" do
    squared_string = Offset.date_string_squared("290198")

    expectation = "84214879204"

    assert squared_string == expectation
  end

  @tag :skip
  test "It can square today's date if there is no arg given" do
    squared_string = Offset.date_string_squared

    assert String.length(squared_string) > 0
  end
end
