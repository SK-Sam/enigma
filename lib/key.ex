defmodule Key do
  defstruct a: nil, b: nil, c: nil, d: nil

  def get_abcd_keys(seed) do
    all_keys = %Key{}
    all_keys = %{all_keys | a: String.slice(seed, 0..1) }
    all_keys = %{all_keys | b: String.slice(seed, 1..2) }
    all_keys = %{all_keys | c: String.slice(seed, 2..3) }
    %{all_keys | d: String.slice(seed, 3..4) }
  end
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
