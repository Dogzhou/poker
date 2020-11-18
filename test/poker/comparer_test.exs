defmodule ComparerTest do
  use ExUnit.Case, async: true
  alias Poker.{Hand, Comparer}
  @straight_flush  Hand.init(~w(2D 3D 4D 5D 6D))
  @straight_flushB Hand.init(~w(2S 3S 4S 5S 6S))
  @four_of_a_kind  Hand.init(~w(JD AH AC AD AS))
  @full_house      Hand.init(~w(AD AC AS KC KD))
  @flush           Hand.init(~w(3D 4D 5D 7D 8D))
  @straight        Hand.init(~w(5D 6S 7D 8D 9D))
  @three_of_a_kind Hand.init(~w(AD AC AS KC QH))
  @two_pairs       Hand.init(~w(AD AC KS KH QD))
  @one_pair        Hand.init(~w(2D 2C 3D 4H 5S))
  @high_card       Hand.init(~w(AC KD QS JH 9D))

  describe "compared hands are in same category" do
    test "straight" do
      lower_straight = Hand.init(~w(2S 3D 4H 5S 6C))
      result = Comparer.compare([@straight], lower_straight)

      assert result == [@straight]
    end

    test "ACE_as_low_value_straight" do
      lower_straight = Hand.init(~w(AS 2D 3H 4S 5C))
      result = Comparer.compare([@straight], lower_straight)

      assert result == [@straight]
    end

    test "full_house" do
      lower_full_house = Hand.init(~w(AS AD AH QS QC))
      result = Comparer.compare([@full_house], lower_full_house)

      assert result == [@full_house]
    end

    test "flush" do
      lower_flush = Hand.init(~w(AS AD AH QS JC))
      result = Comparer.compare([@flush], lower_flush)

      assert result == [@flush]
    end

    test "three_of_a_kind" do
      lower_three_of_a_kind = Hand.init(~w(AS AD AH QS JC))
      result = Comparer.compare([@three_of_a_kind], lower_three_of_a_kind)

      assert result == [@three_of_a_kind]
    end

    test "two_pairs" do
      lower_two_pairs = Hand.init(~w(KS KD QH QS JC))
      result = Comparer.compare([@two_pairs], lower_two_pairs)

      assert result == [@two_pairs]
    end

    test "one_pair" do
      equal_one_pair = Hand.init(~w(2S 2D 3H 4S 5C))
      result = Comparer.compare([@one_pair], equal_one_pair)

      assert result == [@one_pair, equal_one_pair]
    end

    test "high_card" do
      lower_high_card = Hand.init(~w(AS KD QH JS 8C))
      result = Comparer.compare([@high_card], lower_high_card)

      assert result == [@high_card]
    end
  end

  describe "compared hands are in different category" do
    test "straight_flush over four_of_a_kind" do
      result = Comparer.compare([@straight_flush, @straight_flushB], @four_of_a_kind)

      assert result == [@straight_flush, @straight_flushB]
    end

    test "tied straight_flush" do
      same_ranking_straight_flush = Hand.init(~w(2C 3C 4C 5C 6C))
      result = Comparer.compare([@straight_flush, @straight_flushB], same_ranking_straight_flush)

      assert result == [@straight_flush, @straight_flushB, same_ranking_straight_flush]
    end

    test "four_of_a_kind over full_house" do
      result = Comparer.compare([@four_of_a_kind], @full_house)

      assert result == [@four_of_a_kind]
    end

    test "full_house over flush" do
      result = Comparer.compare([@full_house], @flush)

      assert result == [@full_house]
    end

    test "flush over straight" do
      result = Comparer.compare([@straight], @flush)

      assert result == [@flush]
    end

    test "straight over three_of_a_kind" do
      result = Comparer.compare([@three_of_a_kind], @straight)

      assert result == [@straight]
    end

    test "three_of_a_kind over two_pairs" do
      result = Comparer.compare([@three_of_a_kind], @two_pairs)

      assert result == [@three_of_a_kind]
    end

    test "two_pairs over one_pair" do
      result = Comparer.compare([@one_pair], @two_pairs)

      assert result == [@two_pairs]
    end

    test "one_pair over high_card" do
      result = Comparer.compare([@one_pair], @two_pairs)

      assert result == [@two_pairs]
    end
  end
end
