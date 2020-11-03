defmodule Poker.Hand do
  @moduledoc false
  alias Poker.{Card, Hand}
  @enforce_keys [:cards]
  defstruct [:cards, :category]

  @type t() :: %__MODULE__{
    cards: [Card.t()],
    category: String.t()
  }

  @doc """
  Init Hand struct
  ## Examples

    iex> alias Poker.{Card, Hand}
    iex> Hand.init(~w(4D 5S 6S 8D 3C))
    iex> %Hand{cards: [%Card{suit: "D", value: "4"}, %Card{suit: "S", value: "4"}, %Card{suit: "S", value: "6"}, %Card{suit: "D", value: "8"}, %Card{suit: "C", value: "3"}]}
  """
  @spec init(string :: [String.t()]) :: Hand.t()
  def init(string) do
    string
    |> Enum.map(&(Card.init(&1)))
  end
end
