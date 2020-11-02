defmodule Hand do
  @moduledoc false
  @enforce_keys [:cards]
  defstruct [:cards, :category]

  @type t() :: %__MODULE__{
    cards: [Card.t()],
    category: String.t()
  }
end
