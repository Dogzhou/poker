defmodule ClassifyTest do
  use ExUnit.Case
  alias Poker.Hand

  describe "straight flush" do
    @describetag :function

    test "without special letters" do
      hand = Hand.init(~w(4D 5D 6D 7D 8D))
      assert Classify.classify(hand) == :straight_flush
    end
  end
end

