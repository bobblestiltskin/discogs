defmodule DiscogsWeb.ResultsController do
  use DiscogsWeb, :controller

  alias Discogs.Search
#  alias Discogs.Search.Results

#  def artist_filter(items, artist_id) do
#  end

  def index(conn, _params) do
#    items = Search.get_items_by_artist(String.to_integer(_params["artist_choice"]))
    items = Search.filter_items(_params["artist_choice"], _params["label_choice"], _params["format_choice"])
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Search.get_item(id)
    render(conn, "show.html", item: item)
  end
end
