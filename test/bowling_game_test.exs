import BowlingGame

defmodule BowlingGameTest do
  use ExUnit.Case

  test "gutter game scores zero" do
    rolls = roll_many(20, 0)
    assert score(rolls) == 0
  end

  test "score all ones" do
    rolls = roll_many(20, 1)
    assert score(rolls) == 20
  end

  test "score one spare" do
    all_rolls = Enum.concat([5, 5, 3], roll_many(17, 0))
    assert score(all_rolls) == 16
  end

  defp roll_many(times, pins) do
    Enum.into(1..times, [], fn(_) -> pins end)
  end
end
