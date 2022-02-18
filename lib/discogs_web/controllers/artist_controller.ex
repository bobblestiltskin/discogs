defmodule DiscogsWeb.ArtistController do
  use DiscogsWeb, :controller

  alias Discogs.Search

  def index(conn, _params) do
    artists = Search.list_artists_sorted()
    render(conn, "index.html", artists: artists)
  end

  def show(conn, %{"id" => id}) do
    artist = Search.get_artist(id)
    render(conn, "show.html", artist: artist)
  end
end
