defmodule Card do
  @moduledoc false
  @enforce_keys [:suit, :value]
  defstruct [:suit, :value]

  @type t() :: %__MODULE__{
    suit: String.t(),
    value: String.t()
  }
end
