defmodule Poker.BestHand.DifferentCategoryBestHand do
  @moduledoc """
  Return higher hand from two hands when they are in different category
  """
  alias Poker.Hand
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

  @spec find(current_winner_hand :: Hand.t(), next_hand :: Hand.t()) :: Hand.t() | [Hand.t()]
  def find(current_winner_hand, next_hand) do
    current_winner_hand_index = index_of_category(current_winner_hand.category)
    next_hand_index = index_of_category(next_hand.category)

    case current_winner_hand_index - next_hand_index do
      x when x < 0 -> current_winner_hand
      x when x > 0 -> next_hand
      x when x === 0 -> [current_winner_hand, next_hand]
    end
  end

  def index_of_category(category) do
    Enum.find_index(@category_high_to_low, &(&1 == category))
  end
end
