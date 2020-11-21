defmodule Poker.BestHand do
  @moduledoc """
  Return best hands from a list of hands
  """
  alias Poker.Hand
  alias Poker.BestHand.{SameCategoryBestHand, DifferentCategoryBestHand}

  def find(hands), do: Enum.reduce(hands, [], fn hand, acc -> find(acc, hand) end)
  def find([], hand), do: [hand]

  @doc """
  find higher hand from current winner hands and another hand
  """
  @spec find(winnerHands :: [Hand.t()], handB :: Hand.t()) :: [Hand.t()]
  def find(winnerHands, handB) do
    handA = Enum.at(winnerHands, 0)
    winner_hand = find_winner_hand(handA, handB)

    cond do
      winner_hand === handA -> winnerHands
      winner_hand === handB -> [handB]
      winner_hand === [handA, handB] -> winnerHands ++ [handB]
    end
  end

  defp find_winner_hand(handA, handB) when handA.category === handB.category do
    SameCategoryBestHand.find(handA, handB)
  end

  defp find_winner_hand(handA, handB) do
    DifferentCategoryBestHand.find(handA, handB)
  end
end
