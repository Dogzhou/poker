defmodule ComparerTest do
  use ExUnit.Case, async: true
  alias Poker.{Hand, Comparer}

  describe "compared hands are in different category" do
    test "straight_flush over four_of_a_kind" do
      winner_hands = [Hand.init(~w(2D 3D 4D 5D 6D)), Hand.init(~w(2S 3S 4S 5S 6S))]
      four_of_a_kind_hand = Hand.init(~w(JD AH AC AD AS))

      result = Comparer.compare(winner_hands, four_of_a_kind_hand)
      assert result == winner_hands
    end

    test "four_of_a_kind over full_house" do
      four_of_a_kind_hand = Hand.init(~w(JD AH AC AD AS))
      winner_hands = [four_of_a_kind_hand]
      handB = Hand.init(~w(AD AC AD KC KD))

      result = Comparer.compare(winner_hands, handB)
      assert result == winner_hands
    end
  end
end
