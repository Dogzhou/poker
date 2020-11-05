defmodule Poker.Hand do
  @moduledoc false
  alias Poker.{Card, Hand}
  @enforce_keys [:cards, :category]
  defstruct [:cards, :category]

  @type t() :: %__MODULE__{
    cards: [Card.t()],
    category: :atom
  }

  @doc """
  Init Hand struct
  ## Examples

    iex> Poker.Hand.init(~w(4D 5S 6S 8D 3C))
    %Poker.Hand{
      cards: [
        %Poker.Card{suit: "D", value: "4"},
        %Poker.Card{suit: "S", value: "5"},
        %Poker.Card{suit: "S", value: "6"},
        %Poker.Card{suit: "D", value: "8"},
        %Poker.Card{suit: "C", value: "3"}],
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
