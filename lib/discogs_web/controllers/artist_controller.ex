defmodule DiscogsWeb.ArtistController do
  use DiscogsWeb, :controller

  alias Discogs.Search
  alias Discogs.Search.Artist

  def index(conn, _params) do
    artists = Search.list_artists()
    render(conn, "index.html", artists: artists)
  end

  def show(conn, %{"id" => id}) do
    artist = Search.get_artist(id)
    render(conn, "show.html", artist: artist)
  end

end
