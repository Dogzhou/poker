defmodule Poker.Classify do
  @moduledoc """
  Classify cards category
  """
  alias Poker.Card
  @typep category :: :flush | :four_of_a_kind | :full_house | :high_card | :one_pair | :straight | :straight_flush | :three_of_a_kind | :two_pairs
  @a_high_flush "2345678910JQKA"
  @a_low_flush  "A2345678910JQK"

  @doc """
  Return a category for cards
  """
  @spec classify(cards :: [Card.t()]) :: category
  def classify(cards) do
    cond do
      straight_flush?(cards) -> :straight_flush
      four_of_a_kind?(cards) -> :four_of_a_kind
      full_house?(cards) -> :full_house
      flush?(cards) -> :flush
      straight?(cards) -> :straight
      three_of_a_kind?(cards) -> :three_of_a_kind
      two_pairs?(cards) -> :two_pairs
      one_pair?(cards) -> :one_pair
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

  defp four_of_a_kind?(cards) do
    grouped_hand_values = Enum.group_by(cards, &(&1.int_value))

    grouped_size(grouped_hand_values) == 2 && large_value_size(grouped_hand_values) == 4
  end

  defp full_house?(cards) do
    grouped_hand_values = Enum.group_by(cards, &(&1.int_value))

    grouped_size(grouped_hand_values) == 2 && large_value_size(grouped_hand_values) == 3
  end

  defp three_of_a_kind?(cards) do
    grouped_hand_values = Enum.group_by(cards, &(&1.int_value))

    grouped_size(grouped_hand_values) == 3 && large_value_size(grouped_hand_values) == 3
  end

  defp two_pairs?(cards) do
    grouped_hand_values = Enum.group_by(cards, &(&1.int_value))

    grouped_size(grouped_hand_values) == 3 && large_value_size(grouped_hand_values) == 2
  end

  defp one_pair?(cards) do
    grouped_hand_values = Enum.group_by(cards, &(&1.int_value))

    grouped_size(grouped_hand_values) == 4 && large_value_size(grouped_hand_values) == 2
  end

  defp grouped_size(grouped_hand_values) do
    grouped_hand_values
    |> Map.keys()
    |> length()
  end

  defp large_value_size(grouped_hand_values) do
    grouped_hand_values
    |> Map.values()
    |> Enum.max_by(&(length(&1)))
    |> length()
  end
end
