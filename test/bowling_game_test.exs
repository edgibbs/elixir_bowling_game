import BowlingGame
import Enum

defmodule BowlingGameTest do
  use ExUnit.Case

  test "gutter game scores zero" do
    rolls = Enum.into(1..20, [], fn number -> number * 0 end)
    assert score(rolls) == 0
  end

  test "score all ones" do
    rolls = Enum.into(1..20, [], fn number -> 1 end)
    assert score(rolls) == 20
  end

  test "score one spare" do
    rolls = [5, 5, 3]
    rest_of_rolls = Enum.into(4..20, [], fn number -> 0 end)
    all_rolls = Enum.concat(rolls, rest_of_rolls)
    assert score(all_rolls) == 16
  end
end
