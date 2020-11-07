defmodule Poker.Classify do
  @moduledoc """
  Classify a hand category
  """
  alias Poker.Hand
  @typep category :: :flush | :four_of_a_kind | :full_house | :high_card | :pair | :straight | :straight_flush | :three_of_a_kind | :two_pairs | :unknown
  @a_high_flush "2345678910JQKA"
  @a_low_flush  "A2345678910JQK"

  @doc """
  Return a category for a hand
  """
  @spec classify(hand :: Hand.t()) :: category
  def classify(hand) do
    cond do
      straight_flush?(hand) -> :straight_flush
      four_of_a_kind?(hand) -> :four_of_a_kind
      true -> :pair
    end
  end

  defp straight_flush?(hand) do
    flush?(hand) && straight?(hand)
  end

  defp flush?(hand) do
    hand.cards
    |> Enum.map(&(&1.suit))
    |> Enum.uniq()
    |> length()
    |> Kernel.==(1)
  end

  defp straight?(hand) do
    hand_values = Enum.map_join(hand.cards, "", &(&1.display_value))

    @a_high_flush =~ hand_values || @a_low_flush =~ hand_values
  end

  defp four_of_a_kind?(hand) do
    hand_values = Enum.map(hand.cards, &(&1.display_value))

    hand_values |> Enum.uniq() |> length |> Kernel.==(2)
  end
end
