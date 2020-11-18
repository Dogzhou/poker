defmodule Poker.Hand do
  @moduledoc false
  alias Poker.{Card, Hand, Classifier}
  @enforce_keys [:cards, :category]
  defstruct [:cards, :category]

  @type t() :: %__MODULE__{
    cards: [Card.t()],
    category: Classifier.category
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
      category: :straight_flush}
  """
  @spec init(string :: [[String.t()]]) :: Hand.t()
  def init(input) do
    cards    = Enum.map(input, &(Card.init(&1)))
    category = Classifier.classify(cards)

    %__MODULE__{
      cards: cards,
      category: category
    }
  end
end
