defmodule BowlingGame do
  def score(rolls) do
    frames = Enum.chunk(rolls, 2)
    sum(frames)
  end

  defp sum(frames) do
    score_frames(frames)
  end

  defp score_frames([frame|rest_of_frames]) do
    score_frame(frame) + score_frames(rest_of_frames)
  end

  defp score_frames([]) do
    0
  end

  defp score_frame(frame) do
    cond do
      Enum.sum(frame) == 10 -> 13
      true -> Enum.sum(frame)
    end
  end
end
