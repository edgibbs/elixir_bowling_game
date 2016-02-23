import BowlingGame

defmodule BowlingGameTest do
  use ExUnit.Case

  test "gutter game scores zero" do
    assert score(roll_many(20,0)) == 0
  end

  test "score all ones" do
    assert score(roll_many(20,1)) == 20
  end

  test "score one spare" do
    assert score([5, 5, 3] ++ roll_many(17, 0)) == 16
  end

  test "score one strike" do
    assert score([10, 3, 3] ++ roll_many(16, 0)) == 22
  end

  defp roll_many(times, pins) do
    Enum.into(1..times, [], fn(_) -> pins end)
  end
end
