defmodule Poker.Hand do
  @moduledoc false
  alias Poker.{Card, Hand, Classifier}
  @enforce_keys [:cards, :category, :display_string]
  defstruct [:cards, :category, :display_string]

  @type t() :: %__MODULE__{
          cards: [Card.t()],
          category: Classifier.category(),
          display_string: [String.t()]
        }

  @doc """
  Init Hand struct
  ## Examples

    iex> Poker.Hand.init(~w(10D JD QD KD AD))
    %Poker.Hand{
      cards: [
        %Poker.Card{suit: "D", ranking: "10", int_value: 10},
        %Poker.Card{suit: "D", ranking: "J", int_value: 11},
        %Poker.Card{suit: "D", ranking: "Q", int_value: 12},
        %Poker.Card{suit: "D", ranking: "K", int_value: 13},
        %Poker.Card{suit: "D", ranking: "A", int_value: 14}],
      category: :straight_flush,
      display_string: ~w(10D JD QD KD AD)}
  """
  @spec init(string :: [[String.t()]]) :: Hand.t()
  def init(input) do
    cards = sorted_cards(input)
    category = Classifier.classify(cards)

    %__MODULE__{
      cards: cards,
      category: category,
      display_string: input
    }
  end

  defp sorted_cards(input) do
    input
    |> Enum.map(&Card.init/1)
    |> Enum.sort_by(& &1.int_value)
  end
end
