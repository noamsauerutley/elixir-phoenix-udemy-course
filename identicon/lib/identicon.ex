defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grif
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex |> Enum.chunk_every(3, 3, :discard)
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end
end
