defmodule BowlingGame do
  def score(rolls) do
    frames = Enum.chunk(rolls, 2)
    sum(frames)
  end

  def sum(frames) do
    score_frames(frames)
  end

  defp score_frames([frame|rest_of_frames]) do
    Enum.sum(frame) + score_frames(rest_of_frames)
  end

  defp score_frames([]) do
    0
  end
end
