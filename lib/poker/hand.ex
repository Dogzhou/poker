defmodule Poker.Hand do
  @moduledoc false
  alias Poker.{Card, Hand, Classify}
  @enforce_keys [:cards, :category]
  defstruct [:cards, :category]

  @type t() :: %__MODULE__{
    cards: [Card.t()],
    category: Classify.category
  }

  @doc """
  Init Hand struct
  ## Examples

    iex> Poker.Hand.init(~w(4D 5S 6S QD AC))
    %Poker.Hand{
      cards: [
        %Poker.Card{suit: "D", display_value: "4", int_value: 4},
        %Poker.Card{suit: "S", display_value: "5", int_value: 5},
        %Poker.Card{suit: "S", display_value: "6", int_value: 6},
        %Poker.Card{suit: "D", display_value: "Q", int_value: 12},
        %Poker.Card{suit: "C", display_value: "A", int_value: 14}],
      category: :unknown}
  """
  @spec init(string :: [[String.t()]]) :: Hand.t()
  def init(input) do
    cards = input |> Enum.map(&(Card.init(&1)))

    %__MODULE__{
      cards: cards,
      category: :unknown
    }
  end
end
