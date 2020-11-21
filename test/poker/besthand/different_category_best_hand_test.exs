defmodule Poker.BestHand.DifferentCategoryBestHandTest do
  use ExUnit.Case, async: true
  alias Poker.Hand
  alias Poker.BestHand.DifferentCategoryBestHand

  @straight_flush Hand.init(~w(2D 3D 4D 5D 6D))
  @straight_flushB Hand.init(~w(2S 3S 4S 5S 6S))
  @four_of_a_kind Hand.init(~w(JD AH AC AD AS))
  @full_house Hand.init(~w(AD AC AS KC KD))
  @flush Hand.init(~w(3D 4D 5D 7D 8D))
  @straight Hand.init(~w(5D 6S 7D 8D 9D))
  @three_of_a_kind Hand.init(~w(AD AC AS KC QH))
  @two_pairs Hand.init(~w(AD AC KS KH QD))
  @one_pair Hand.init(~w(2D 2C 3D 4H 5S))
  @high_card Hand.init(~w(AC KD QS JH 9D))

  test "straight_flush over four_of_a_kind" do
    result = DifferentCategoryBestHand.find(@straight_flush, @four_of_a_kind)

    assert result == @straight_flush
  end

  test "tied straight_flush" do
    result = DifferentCategoryBestHand.find(@straight_flush, @straight_flushB)

    assert result == [@straight_flush, @straight_flushB]
  end

  test "four_of_a_kind over full_house" do
    result = DifferentCategoryBestHand.find(@four_of_a_kind, @full_house)

    assert result == @four_of_a_kind
  end

  test "full_house over flush" do
    result = DifferentCategoryBestHand.find(@full_house, @flush)

    assert result == @full_house
  end

  test "flush over straight" do
    result = DifferentCategoryBestHand.find(@straight, @flush)

    assert result == @flush
  end

  test "straight over three_of_a_kind" do
    result = DifferentCategoryBestHand.find(@three_of_a_kind, @straight)

    assert result == @straight
  end

  test "three_of_a_kind over two_pairs" do
    result = DifferentCategoryBestHand.find(@three_of_a_kind, @two_pairs)

    assert result == @three_of_a_kind
  end

  test "two_pairs over one_pair" do
    result = DifferentCategoryBestHand.find(@one_pair, @two_pairs)

    assert result == @two_pairs
  end

  test "one_pair over high_card" do
    result = DifferentCategoryBestHand.find(@one_pair, @high_card)

    assert result == @one_pair
  end
end
