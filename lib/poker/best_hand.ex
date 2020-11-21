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
  @spec find(winner_hands :: [Hand.t()], next_hand :: Hand.t()) :: [Hand.t()]
  def find(winner_hands, next_hand) do
    handA = Enum.at(winner_hands, 0)
    winner_hand = find_winner_hand(handA, next_hand)

    cond do
      winner_hand === handA -> winner_hands
      winner_hand === next_hand -> [next_hand]
      winner_hand === [handA, next_hand] -> winner_hands ++ [next_hand]
    end
  end

  defp find_winner_hand(handA, next_hand) when handA.category === next_hand.category do
    SameCategoryBestHand.find(handA, next_hand)
  end

  defp find_winner_hand(handA, next_hand) do
    DifferentCategoryBestHand.find(handA, next_hand)
  end
end
