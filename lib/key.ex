defmodule Key do
  def create_seed(seed \\ "") do
    random_single_digit =
      Enum.random(0..9)
      |> Integer.to_string()
    seed = seed <> random_single_digit

    if String.length(seed) < 5 do
      create_seed(seed)
    else
      seed
    end
  end
end
