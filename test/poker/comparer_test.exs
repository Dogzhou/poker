defmodule ComparerTest do
  use ExUnit.Case, async: true
  alias Poker.{Hand, Comparer}
  @straight_flush_hand  Hand.init(~w(2D 3D 4D 5D 6D))
  @straight_flush_handB Hand.init(~w(2S 3S 4S 5S 6S))
  @four_of_a_kind_hand  Hand.init(~w(JD AH AC AD AS))
  @full_house_hand      Hand.init(~w(AD AC AS KC KD))
  @flush_hand           Hand.init(~w(3D 4D 5D 6D 8D))

  describe "compared hands are in different category" do
    test "straight_flush over four_of_a_kind" do
      result = Comparer.compare([@straight_flush_hand, @straight_flush_handB], @four_of_a_kind_hand)

      assert result == [@straight_flush_hand, @straight_flush_handB]
    end

    test "four_of_a_kind over full_house" do
      result = Comparer.compare([@four_of_a_kind_hand], @full_house_hand)

      assert result == [@four_of_a_kind_hand]
    end

    test "full_house over flush" do
      result = Comparer.compare([@full_house_hand], @flush_hand)

      assert result == [@full_house_hand]
    end
  end
end
