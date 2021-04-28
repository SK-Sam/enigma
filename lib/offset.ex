defmodule Offset do

  def date_string_squared(date_string)  do
    date_string
    |> String.to_integer()
    |> :math.pow(2)
    |> round()
    |> Integer.to_string()
  end
end
