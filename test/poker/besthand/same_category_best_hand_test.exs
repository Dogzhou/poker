defmodule Poker.BestHand.SameCategoryBestHandTest do
  use ExUnit.Case, async: true
  alias Poker.Hand
  alias Poker.BestHand.SameCategoryBestHand

  @straight_flush  Hand.init(~w(2D 3D 4D 5D 6D))
  @four_of_a_kind  Hand.init(~w(JD AH AC AD AS))
  @full_house      Hand.init(~w(AD AC AS KC KD))
  @flush           Hand.init(~w(3D 4D 5D 7D 8D))
  @straight        Hand.init(~w(5D 6S 7D 8D 9D))
  @three_of_a_kind Hand.init(~w(AD AC AS KC QH))
  @two_pairs       Hand.init(~w(AD AC KS KH QD))
  @one_pair        Hand.init(~w(2D 2C 3D 4H 5S))
  @high_card       Hand.init(~w(AC KD QS JH 9D))

  test "straight_flush" do
    lower_straight_flush = Hand.init(~w(AS 2S 3S 4S 5S))
    result = SameCategoryBestHand.find(@straight_flush, lower_straight_flush)

    assert result == @straight_flush
  end

  test "straight" do
    lower_straight = Hand.init(~w(2S 3D 4H 5S 6C))
    result = SameCategoryBestHand.find(@straight, lower_straight)

    assert result == @straight
  end

  test "ACE_as_low_value_straight" do
    lower_straight = Hand.init(~w(AS 2D 3H 4S 5C))
    result = SameCategoryBestHand.find(@straight, lower_straight)

    assert result == @straight
  end

  test "four_of_a_kind" do
    lower_four_of_a_kind = Hand.init(~w(AS AD AH AS 9C))
    result = SameCategoryBestHand.find(@four_of_a_kind, lower_four_of_a_kind)

    assert result == @four_of_a_kind
  end

  test "full_house" do
    lower_full_house = Hand.init(~w(AS AD AH QS QC))
    result = SameCategoryBestHand.find(@full_house, lower_full_house)

    assert result == @full_house
  end

  test "flush" do
    lower_flush = Hand.init(~w(2S 3D 4H 5S 7C))
    result = SameCategoryBestHand.find(@flush, lower_flush)

    assert result == @flush
  end

  test "three_of_a_kind" do
    lower_three_of_a_kind = Hand.init(~w(AS AD AH QS JC))
    result = SameCategoryBestHand.find(@three_of_a_kind, lower_three_of_a_kind)

    assert result == @three_of_a_kind
  end

  test "two_pairs" do
    lower_two_pairs = Hand.init(~w(KS KD QH QS JC))
    result = SameCategoryBestHand.find(@two_pairs, lower_two_pairs)

    assert result == @two_pairs
  end

  test "one_pair" do
    equal_one_pair = Hand.init(~w(2S 2D 3H 4S 5C))
    result = SameCategoryBestHand.find(@one_pair, equal_one_pair)

    assert result == [@one_pair, equal_one_pair]
  end

  test "high_card" do
    lower_high_card = Hand.init(~w(AS KD QH JS 8C))
    result = SameCategoryBestHand.find(@high_card, lower_high_card)

    assert result == @high_card
  end
end
