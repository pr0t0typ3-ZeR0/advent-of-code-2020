defmodule Day1 do
  def run() do
    list =
      "input"
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)

    [{a, b} | _] = for x <- list, y <- list, x + y == 2020, do: {x, y}
    IO.puts("Part 1: #{a} * #{b} = #{a * b}")

    [{a, b, c} | _] = for x <- list, y <- list, z <- list, x + y + z == 2020, do: {x, y, z}
    IO.puts("Part 2: #{a} * #{b} * #{c} = #{a * b * c}")
  end
end
