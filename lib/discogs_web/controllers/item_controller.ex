defmodule DiscogsWeb.ItemController do
  use DiscogsWeb, :controller

  alias Discogs.Search

  def index(conn, _params) do
    items = Search.list_items()
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Search.get_item(id)
    render(conn, "show.html", item: item)
  end
end
