defmodule Classify do
  @moduledoc """
  Classify a hand category
  """
  @typep category :: :flush | :four_of_a_kind | :full_house | :high_card | :pair | :staight | :straight_flush | :three_of_a_kind | :two_pairs

  @doc """
  Return a category for a hand
  """
  @spec classify(hand :: Hand.t()) :: category
  def classify(_hand) do
    :flush
  end
end
