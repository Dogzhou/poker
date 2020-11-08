defmodule Poker.Classify do
  @moduledoc """
  Classify cards category
  """
  alias Poker.{Card, Hand}
  @typep category :: :flush | :four_of_a_kind | :full_house | :high_card | :pair | :straight | :straight_flush | :three_of_a_kind | :two_pairs | :unknown
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
      true -> :pair
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
    hand_values = Enum.map(cards, &(&1.display_value))

    hand_values |> Enum.uniq() |> length |> Kernel.==(2)
  end
end
