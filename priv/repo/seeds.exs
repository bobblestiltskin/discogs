# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Discogs.Repo.insert!(%Discogs.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Discogs.Repo
alias Discogs.Search.Artist
alias Discogs.Search.Label
alias Discogs.Search.Format
alias Discogs.Search.Item

defmodule Discogs.Import do
  @doc "Imports data from the given CSV to the database"
  def import_from_csv(csv_path) do
    File.stream!(Path.expand(csv_path))
    |> CSV.decode(headers: true)
    |> Stream.each(fn {:ok, row} ->
      _process_csv_row(row)
    end)
    |> Stream.run()
  end

  defp _process_csv_row(row) do
    IO.inspect(row)

    artist_id = _process_artist(row["Artist"])
    IO.puts('OUTSIDE artist is #{artist_id}')
    label_id = _process_label(row["Label"])
    IO.puts('OUTSIDE label is #{label_id}')
    format_id = _process_format(row["Format"])
    IO.puts('OUTSIDE format is #{format_id}')

    item_id =
      _process_item(
        row["Catalog#"],
        row["Title"],
        row["Released"],
        row["release_id"],
        artist_id,
        label_id,
        format_id
      )
    IO.puts('OUTSIDE item is #{item_id}')
  end

  defp _process_artist(artist) do
    case Repo.get_by(Artist, artist: artist) do
      nil ->
        artist = Repo.insert_or_update!(Artist.changeset(%Artist{}, %{artist: artist}))
        artist.id
      artist ->
        artist.id
    end
  end

  defp _process_label(label) do
    case Repo.get_by(Label, label: label) do
      nil ->
        label = Repo.insert_or_update!(Label.changeset(%Label{}, %{label: label}))
        label.id
      label ->
        label.id
    end
  end

  defp _process_format(format) do
    case Repo.get_by(Format, format: format) do
      nil ->
        format = Repo.insert_or_update!(Format.changeset(%Format{}, %{format: format}))
        format.id
      format ->
        format.id
    end
  end

  ##  defp _process_generic(Generic, genatom, generic) do
  #  defp _process_generic(Generic, genatom) do
  ##    case Repo.get_by(Generic, genatom generic) do
  #    case Repo.get_by(Generic, genatom) do
  #      nil -> 
  ## 	generic = Repo.insert_or_update!(Generic.changeset(%Generic{}, %{genatom generic}))
  #        generic = Repo.insert_or_update!(Generic.changeset(%Generic{}, %{genatom}))
  #        generic.id
  #      generic -> 
  #        generic.id
  #    end
  #  end

  defp _process_item(
         catalogue_number,
         title,
         released,
         release_id,
         artist_id,
         label_id,
         format_id
       ) do
    case Repo.get_by(Item, release_id: release_id) do
      nil ->
        item =
          Repo.insert_or_update!(
            Item.changeset(%Item{}, %{
              catalogue_number: catalogue_number,
              title: title,
              released: released,
              release_id: release_id,
              artist_id: artist_id,
              label_id: label_id,
              format_id: format_id
            })
          )
        item.id
      item ->
        item.id
    end
  end
end

System.argv()
|> Discogs.Import.import_from_csv()
