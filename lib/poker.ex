defmodule Poker do
  @moduledoc false
  alias Poker.{Hand, Comparer}

  @doc """
  Given a list of poker hands, return a list containing the highest scoring hand.
  ## Examples

  """
  @spec best_hand(list(list(String.t()))) :: list(list(String.t()))
  def best_hand(hands) do
    hands
    |> Enum.map(&(Hand.init(&1)))
    |> Comparer.compare()
    |> Enum.map(&Hand.stringify(&1))
  end
end
