defmodule Day3 do
  def run() do
    map =
      "input"
      |> File.read!()
      |> String.split("\n", trim: true)

    map
    |> num_trees(3, 1)
    |> Integer.to_string()
    |> (&("Part 1: " <> &1)).()
    |> IO.puts()

    map
    |> (&(num_trees(&1, 1, 1) *
            num_trees(&1, 3, 1) *
            num_trees(&1, 5, 1) *
            num_trees(&1, 7, 1) *
            num_trees(&1, 1, 2))).()
    |> Integer.to_string()
    |> (&("Part 2: " <> &1)).()
    |> IO.puts()
  end

  def num_trees(map, x, y) do
    map
    |> Enum.take_every(y)
    |> Enum.with_index()
    |> Enum.map(fn {row, n} ->
      row
      |> String.to_charlist()
      |> Stream.cycle()
      |> Enum.at(x * n)
      |> case do
        ?# -> 1
        ?. -> 0
      end
    end)
    |> Enum.sum()
  end
end
