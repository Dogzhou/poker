defmodule Poker do
  @moduledoc false
  alias Poker.{Hand, BestHand}

  @doc """
  Given a list of poker hands, return a list containing the highest scoring hand.
  ## Examples

    iex(1)> high_of_8 = ~w(4D 5S 6S 8D 3C)
    iex(2)> high_of_10 = ~w(2S 4C 7S 9H 10H)
    iex(3)> high_of_jack = ~w(3S 4S 5D 6H JH)
    iex(4)> Poker.best_hand([high_of_8, high_of_10, high_of_jack])
    [~w(3S 4S 5D 6H JH)]
  """
  @spec best_hand(list(list(String.t()))) :: list(list(String.t()))
  def best_hand(hands) do
    hands
    |> Enum.map(&Hand.init(&1))
    |> BestHand.find()
    |> Enum.map(& &1.display_string)
  end
end
