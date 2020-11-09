defmodule Poker.Card do
  @moduledoc false
  @enforce_keys [:suit, :display_value, :int_value]
  defstruct [:suit, :display_value, :int_value]
  alias Poker.Card

  @type t() :: %__MODULE__{
    suit: String.t(),
    display_value: String.t(),
    int_value: integer()
  }

  @doc """
  Init Card struct
  ## Examples

    iex> Poker.Card.init("3S")
    %Poker.Card{suit: "S", display_value: "3", int_value: 3}

    iex> Poker.Card.init("JD")
    %Poker.Card{suit: "D", display_value: "J", int_value: 11}
  """
  @spec init(string :: String.t()) :: Card.t()
  def init(string) do
    suit  = String.at(string, -1)
    display_value = String.slice(string, 0..-2)
    int_value = get_int_value(display_value)

    %__MODULE__{
      suit: suit,
      display_value: display_value,
      int_value: int_value
    }
  end

  defp get_int_value("J"), do: 11
  defp get_int_value("Q"), do: 12
  defp get_int_value("K"), do: 13
  defp get_int_value("A"), do: 14
  defp get_int_value(display_value), do: String.to_integer(display_value)
end
