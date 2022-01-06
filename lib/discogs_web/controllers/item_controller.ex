defmodule DiscogsWeb.ItemController do
  use DiscogsWeb, :controller


  def index(conn, _params) do
    items = Discogs.Search.list_items()
    render(conn, "index.html", items: items)
  end
end
