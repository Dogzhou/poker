defmodule Poker.Comparer do
  @moduledoc """
  Compare two hands and return the higher ranking hand
  """
  alias Poker.Hand
  alias Poker.Comparer.{CategoryComparer, ValueComparer}

  @doc """
  compare two hands when they are in different category
  """
  @spec compare(winnerHands :: [Hand.t()], handB :: Hand.t()) :: [Hand.t()]
  def compare(winnerHands, handB) do
    handA = Enum.at(winnerHands, 0)
    winner_hand = higher_ranking_hand(handA, handB)

    cond do
      winner_hand === handA -> winnerHands
      winner_hand === handB -> [handB]
      winner_hand === [handA, handB] -> winnerHands ++ [handB]
    end
  end

  defp higher_ranking_hand(handA, handB) when handA.category === handB.category do
    ValueComparer.compare(handA, handB)
  end

  defp higher_ranking_hand(handA, handB) do
    CategoryComparer.compare(handA, handB)
  end
end
