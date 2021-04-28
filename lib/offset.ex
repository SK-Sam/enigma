defmodule Offset do

  def date_string_squared(date_string)  do
    date_string
    |> String.to_integer()
    |> :math.pow(2)
    |> round()
    |> Integer.to_string()
  end

  def date_string_squared do
    datetime = DateTime.utc_now
    day = Integer.to_string(datetime.day) |> add_zero_to_date_string()
    month = Integer.to_string(datetime.month) |> add_zero_to_date_string()
    year = Integer.to_string(datetime.year)

    date_string = day <> month <> year
    date_string_squared(date_string)
  end

  def add_zero_to_date_string(date_string) do
    if String.length(date_string) == 1 do
      "0" <> date_string
    else
      date_string
    end
  end
end
