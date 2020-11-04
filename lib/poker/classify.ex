defmodule Classify do
  @moduledoc """
  Classify a hand category
  """
  alias Poker.Hand
  @typep category :: :flush | :four_of_a_kind | :full_house | :high_card | :pair | :straight | :straight_flush | :three_of_a_kind | :two_pairs

  @doc """
  Return a category for a hand
  """
  @spec classify(hand :: Hand.t()) :: category
  def classify(hand) do
    cond do
      straight_flush?(hand) -> :straight_flush
      true -> :pair
    end
  end

  defp straight_flush?(hand), do: true
end
