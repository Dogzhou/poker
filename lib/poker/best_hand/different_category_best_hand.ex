defmodule Poker.BestHand.DifferentCategoryBestHand do
  @moduledoc """
  Return higher hand from two hands when they are in different category
  """
  @category_high_to_low ~w(
    straight_flush
    four_of_a_kind
    full_house
    flush
    straight
    three_of_a_kind
    two_pairs
    one_pair
    high_card
  )a

  @spec find(handA :: Hand.t(), handB :: Hand.t()) :: Hand.t() | [Hand.t()]
  def find(handA, handB) do
    handA_ranking = ranking_of_category(handA.category)
    handB_ranking = ranking_of_category(handB.category)

    case handA_ranking - handB_ranking do
      x when x < 0 -> handA
      x when x > 0 -> handB
      x when x === 0 -> [handA, handB]
    end
  end

  def ranking_of_category(category) do
    Enum.find_index(@category_high_to_low, &(&1 == category))
  end
end