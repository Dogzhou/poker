defmodule Poker.Classify do
  @moduledoc """
  Classify cards category
  """
  alias Poker.{Card, Utils}
  @type category :: :flush | :four_of_a_kind | :full_house | :high_card | :one_pair | :straight | :straight_flush | :three_of_a_kind | :two_pairs
  @a_high_flush "2345678910JQKA"
  @a_low_flush  "A2345678910JQK"

  @doc """
  Return a category for cards
  """
  @spec classify(cards :: [Card.t()]) :: category
  # credo:disable-for-next-line
  def classify(cards) do
    grouped_hand_values = Enum.group_by(cards, &(&1.int_value))

    cond do
      straight_flush?(cards) -> :straight_flush
      four_of_a_kind?(grouped_hand_values) -> :four_of_a_kind
      full_house?(grouped_hand_values) -> :full_house
      flush?(cards) -> :flush
      straight?(cards) -> :straight
      three_of_a_kind?(grouped_hand_values) -> :three_of_a_kind
      two_pairs?(grouped_hand_values) -> :two_pairs
      one_pair?(grouped_hand_values) -> :one_pair
      true -> :high_card
    end
  end

  defp straight_flush?(cards) do
    flush?(cards) && straight?(cards)
  end

  defp flush?(cards) do
    cards
    |> Enum.map(&(&1.suit))
    |> Enum.uniq()
    |> length()
    |> Kernel.==(1)
  end

  defp straight?(cards) do
    hand_values = Enum.map_join(cards, "", &(&1.display_value))

    @a_high_flush =~ hand_values || @a_low_flush =~ hand_values
  end

  defp four_of_a_kind?(grouped_hand_values) do
    Utils.grouped_size(grouped_hand_values) == 2 && Utils.large_value_size(grouped_hand_values) == 4
  end

  defp full_house?(grouped_hand_values) do
    Utils.grouped_size(grouped_hand_values) == 2 && Utils.large_value_size(grouped_hand_values) == 3
  end

  defp three_of_a_kind?(grouped_hand_values) do
    Utils.grouped_size(grouped_hand_values) == 3 && Utils.large_value_size(grouped_hand_values) == 3
  end

  defp two_pairs?(grouped_hand_values) do
    Utils.grouped_size(grouped_hand_values) == 3 && Utils.large_value_size(grouped_hand_values) == 2
  end

  defp one_pair?(grouped_hand_values) do
    Utils.grouped_size(grouped_hand_values) == 4 && Utils.large_value_size(grouped_hand_values) == 2
  end
end
