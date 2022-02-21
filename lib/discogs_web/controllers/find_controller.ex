defmodule DiscogsWeb.FindController do
  use DiscogsWeb, :controller

  alias Discogs.Search

  def index(conn, _params) do
    artists = Search.list_artists_sorted()
    labels = Search.list_labels_sorted()
    formats = Search.list_formats_sorted()
    render(conn, "index.html", artists: artists, labels: labels, formats: formats)
  end

  def show(conn, %{"id" => id}) do
    artist = Search.get_artist(id)
    render(conn, "show.html", artist: artist)
  end
end
