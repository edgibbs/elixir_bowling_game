import BowlingGame
import Enum

defmodule BowlingGameTest do
  use ExUnit.Case

  test "gutter game scores zero" do
    rolls = Enum.into(1..20, [], fn number -> number * 0 end)
    assert score(rolls) == 0
  end
end
