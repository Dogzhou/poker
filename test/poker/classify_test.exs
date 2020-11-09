defmodule ClassifyTest do
  use ExUnit.Case
  alias Poker.{Hand, Classify}

  describe "straight flush" do
    @describetag :function

    test "without special letters" do
      hand = Hand.init(~w(4D 5D 6D 7D 8D))

      assert Classify.classify(hand.cards) == :straight_flush
    end

    test "with special letters" do
      hand = Hand.init(~w(10D JD QD KD AD))

      assert Classify.classify(hand.cards) == :straight_flush
    end

    test "with A as lowest letters" do
      hand = Hand.init(~w(AD 2D 3D 4D 5D))

      assert Classify.classify(hand.cards) == :straight_flush
    end

    test "with A as highest letters" do
      hand = Hand.init(~w(10D JD QD KD AD))

      assert Classify.classify(hand.cards) == :straight_flush
    end
  end

  describe "four of a kind" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(3D 3H 3S 3C 8D))

      assert Classify.classify(hand.cards) == :four_of_a_kind
    end
  end

  describe "full house" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(3D 3H 3S 8C 8D))

      assert Classify.classify(hand.cards) == :full_house
    end
  end

  describe "flush" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(3D 4D 8D 10D QD))

      assert Classify.classify(hand.cards) == :flush
    end
  end

  describe "straight" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(AD 2S 3H 4C 5D))

      assert Classify.classify(hand.cards) == :straight
    end
  end

  describe "three of a kind" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(AD AS AH 4C 5D))

      assert Classify.classify(hand.cards) == :three_of_a_kind
    end
  end

  describe "two pairs" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(2D 2S 4H 4C 5D))

      assert Classify.classify(hand.cards) == :two_pairs
    end
  end

  describe "one pair" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(2D 2S 3H 4C 5D))

      assert Classify.classify(hand.cards) == :one_pair
    end
  end

  describe "high card" do
    @describetag :function

    test "returns true" do
      hand = Hand.init(~w(2D 3S 5H 6C 7D))

      assert Classify.classify(hand.cards) == :high_card
    end
  end
end

