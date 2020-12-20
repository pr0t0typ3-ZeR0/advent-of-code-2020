defmodule Day2 do
  def run() do
    regex = ~r/\A(\d+)-(\d+) (\w): (\w+)\z/

    list =
      "input"
      |> File.read!()
      |> String.split("\n", trim: true)
      |> Enum.map(&Regex.run(regex, &1, capture: :all_but_first))
      |> Enum.map(fn [least, most, char, passwd] ->
        {String.to_integer(least), String.to_integer(most), char, passwd}
      end)

    list
    |> Enum.filter(fn {least, most, char, passwd} ->
      count = Enum.count(String.graphemes(passwd), &(&1 == char))
      least <= count && count <= most
    end)
    |> Enum.count()
    |> Integer.to_string()
    |> (&("Part 1: " <> &1)).()
    |> IO.puts()

    list
    |> Enum.filter(fn {least, most, char, passwd} ->
      fst = String.at(passwd, least - 1) == char
      snd = String.at(passwd, most - 1) == char
      (fst && !snd) || (!fst && snd)
    end)
    |> Enum.count()
    |> Integer.to_string()
    |> (&("Part 2: " <> &1)).()
    |> IO.puts()
  end
end
