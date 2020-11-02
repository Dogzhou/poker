defmodule ClassifyTest do
  use ExUnit.Case

  describe "classify" do
    @describetag :function

    test "first test case" do
      hand = ~w(4D 5S 6S 8D 3C)
      assert Classify.classify(hand) == :flush
    end
  end
end

