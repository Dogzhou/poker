defmodule ClassifyTest do
  use ExUnit.Case
  alias Poker.{Hand, Classify}

  describe "straight flush" do
    @describetag :function

    test "without special letters" do
      hand = Hand.init(~w(4D 5D 6D 7D 8D))

      assert Classify.classify(hand) == :straight_flush
    end

    test "with special letters" do
      hand = Hand.init(~w(10D JD QD KD AD))

      assert Classify.classify(hand) == :straight_flush
    end

    test "with A as lowest letters" do
      hand = Hand.init(~w(AD 2D 3D 4D 5D))

      assert Classify.classify(hand) == :straight_flush
    end

    test "with A as highest letters" do
      hand = Hand.init(~w(10D JD QD KD AD))

      assert Classify.classify(hand) == :straight_flush
    end
  end

  describe "four of a kind" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(3D 3H 3S 3C 8D))

      assert Classify.classify(hand) == :four_of_a_kind
    end
  end
end

