defmodule Poker.Card do
  @moduledoc false
  @enforce_keys [:suit, :value]
  defstruct [:suit, :value]
  alias Poker.Card

  @type t() :: %__MODULE__{
    suit: String.t(),
    value: String.t()
  }

  @doc """
  Init Card struct
  ## Examples

    iex> Card.init("3S")
    iex> %Card{suit: "S", value: 3}

    iex> Card.init("10D")
    iex> %Card{suit: "D", value: 10}
  """
  @spec init(string :: String.t()) :: Card.t()
  def init(string) do
    suit  = String.at(string, -1)
    value = String.slice(string, 0..-2)

    %__MODULE__{
      suit: suit,
      value: value
    }
  end
end
