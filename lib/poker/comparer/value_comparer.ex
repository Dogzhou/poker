defmodule Poker.Comparer.ValueComparer do
  @moduledoc """
  Compare two hands when they are in same category returns the higher hand
  """
  def compare(handA, handB) do
    handA_values = values_of(handA)
    handB_values = values_of(handB)

    cond do
      handA_values > handB_values -> handA
      handA_values < handB_values -> handB
      handA_values == handB_values -> [handA, handB]
    end
  end

  defp values_of(hand) when hand.category in ~w(straight_flush straight)a do
    hand.cards
    |> Enum.map(&(&1.int_value))
    |> Enum.sort_by(&(&1))
    |> comparable_value()
    |> List.wrap()
  end

  defp values_of(hand) when hand.category in ~w(flush high_card)a, do: Enum.map(hand.cards, &(&1.int_value))

  defp values_of(hand) do
    hand.cards
    |> Enum.group_by(&(&1.int_value))
    |> Enum.sort_by(&{length(elem(&1, 1)), elem(&1, 0)}, :desc)
    |> Enum.map(&(elem(&1, 0)))
  end

  defp comparable_value(values) when values == [2, 3, 4, 5, 14], do: 5
  defp comparable_value(values), do: Enum.at(values, -1)
end
