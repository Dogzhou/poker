defmodule Poker.Card do
  @moduledoc false
  @enforce_keys [:suit, :ranking, :int_value]
  defstruct [:suit, :ranking, :int_value]
  alias Poker.Card

  @type t() :: %__MODULE__{
    suit: String.t(),
    ranking: String.t(),
    int_value: integer()
  }

  @doc """
  Init Card struct
  ## Examples

    iex> Poker.Card.init("3S")
    %Poker.Card{suit: "S", ranking: "3", int_value: 3}

    iex> Poker.Card.init("JD")
    %Poker.Card{suit: "D", ranking: "J", int_value: 11}
  """
  @spec init(string :: String.t()) :: Card.t()
  def init(string) do
    suit  = String.at(string, -1)
    ranking = String.slice(string, 0..-2)
    int_value = get_int_value(ranking)

    %__MODULE__{
      suit: suit,
      ranking: ranking,
      int_value: int_value
    }
  end

  defp get_int_value("J"), do: 11
  defp get_int_value("Q"), do: 12
  defp get_int_value("K"), do: 13
  defp get_int_value("A"), do: 14
  defp get_int_value(ranking), do: String.to_integer(ranking)
end
