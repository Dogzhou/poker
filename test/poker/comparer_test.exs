defmodule Poker.ComparerTest do
  use ExUnit.Case, async: true
  alias Poker.Comparer
  @hand         Poker.Hand.init(~w(2D 3D 4D 5D 6D))
  @equal_hand   Poker.Hand.init(~w(2S 3S 4S 5S 6S))
  @smaller_hand Poker.Hand.init(~w(AC 2C 3C 4C 5C))
  @bigger_hand  Poker.Hand.init(~w(3H 4H 5H 6H 7H))

  describe "winnerHands has multiple hands" do
    test "winnerHands win" do
      result = Poker.Comparer.compare([@hand, @equal_hand], @smaller_hand)

      assert result == [@hand, @equal_hand]
    end

    test "winnerHands lose" do
      result = Poker.Comparer.compare([@hand, @equal_hand], @bigger_hand)

      assert result == [@bigger_hand]
    end

    test "tie" do
      another_equal_hand = Poker.Hand.init(~w(2C 3C 4C 5C 6C))
      result = Poker.Comparer.compare([@hand, @equal_hand], another_equal_hand)

      assert result == [@hand, @equal_hand, another_equal_hand]
    end
  end

  describe "winnerHands only have one hand" do
    test "winnerHands win" do
      result = Poker.Comparer.compare([@hand], @smaller_hand)

      assert result == [@hand]
    end

    test "winnerHands lose" do
      result = Poker.Comparer.compare([@hand], @bigger_hand)

      assert result == [@bigger_hand]
    end

    test "tie" do
      result = Poker.Comparer.compare([@hand], @equal_hand)

      assert result == [@hand, @equal_hand]
    end
  end
end
