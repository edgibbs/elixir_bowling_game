defmodule BowlingGame do
  def score(rolls) do
    frames = Enum.chunk(rolls, 2)
    frames = create_frames(rolls, [])
    score_frames(frames)
  end

  defp score_frames([frame|rest_of_frames]) do
    score_frame(frame, rest_of_frames) + score_frames(rest_of_frames)
  end

  defp score_frames([]) do
    0
  end

  defp score_frame(frame, rest_of_frames) do
    following_rolls = List.flatten(rest_of_frames)
    cond do
      frame == [10] && Enum.count(following_rolls) < 2 ->
        0
      frame == [10] ->
        10 + Enum.sum(Enum.take(following_rolls, 2))
      Enum.sum(frame) == 10 -> 10 + Enum.sum(Enum.take(following_rolls, 1))
      true -> Enum.sum(frame)
    end
  end

  defp create_frames([roll|rest_of_rolls], frames) do
    cond do
      roll == 10 && List.last(frames) != [0] ->
        create_frames(rest_of_rolls, Enum.into(frames, [[10]]))
      Enum.count(Enum.at(frames, 0, [])) == 1 && Enum.at(frames, 0) != [10] ->
        new_frame = Enum.at(frames, 0, []) ++ [roll]
        frames = List.delete_at(frames, 0)
        create_frames(rest_of_rolls, Enum.into(frames, [new_frame]))
      true ->
        create_frames(rest_of_rolls, Enum.into(frames, [[roll]]))
    end
  end

  defp create_frames([], frames) do
    Enum.reverse(frames)
  end
end
