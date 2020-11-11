defmodule Poker.Utils do
  @moduledoc false

  @doc """
  ## Examples

    iex> grouped_hand_values = %{2 => ["card1", "card2", "card3"], 4 => ["card4", "card5"] }
    iex> Poker.Utils.grouped_size(grouped_hand_values)
    2

    iex> grouped_hand_values = %{2 => ["card1", "card2"], 4 => ["card3", "card4"], 6 => ["card5"] }
    iex> Poker.Utils.grouped_size(grouped_hand_values)
    3
  """
  @spec grouped_size(grouped_hand_values :: %{integer() => [Poker.Card.t()]}) :: integer()
  def grouped_size(grouped_hand_values) do
    grouped_hand_values
    |> Map.keys()
    |> length()
  end

  @doc """
  ## Examples

    iex> grouped_hand_values = %{2 => ["card1", "card2", "card3"], 4 => ["card4", "card5"] }
    iex> Poker.Utils.large_value_size(grouped_hand_values)
    3

    iex> grouped_hand_values = %{2 => ["card1", "card2"], 4 => ["card3", "card4"], 6 => ["card5"] }
    iex> Poker.Utils.large_value_size(grouped_hand_values)
    2
  """
  @spec large_value_size(grouped_hand_values :: %{integer() => [Poker.Card.t()]}) :: integer()
  def large_value_size(grouped_hand_values) do
    grouped_hand_values
    |> Map.values()
    |> Enum.max_by(&(length(&1)))
    |> length()
  end
end
