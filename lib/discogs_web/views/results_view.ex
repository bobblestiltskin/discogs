defmodule DiscogsWeb.ResultsView do
  use DiscogsWeb, :view

  alias Discogs.Search

  def artist_name(artist_id) do
    Search.get_artist(artist_id).artist
#    artist_id
#    |> Search.get_artist_name()
  end

  def format_name(format_id) do
    Search.get_format(format_id).format
  end

  def label_name(label_id) do
    Search.get_label(label_id).label
  end
end
