defmodule DiscogsWeb.ItemController do
  use DiscogsWeb, :controller

  alias Discogs.Search
#  alias Discogs.Search.Artist

  def index(conn, _params) do
    items = Search.list_items()
#    artists = Search.list_artists()
#    render(conn, "index.html", items: items, artists: artists)
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Search.get_item(id)
#    artist = Search.get_artist(item.artist_id)
#    render(conn, "show.html", item: item, artist: artist)
    render(conn, "show.html", item: item)
  end
end
