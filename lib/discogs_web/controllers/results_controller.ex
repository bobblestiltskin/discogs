defmodule DiscogsWeb.ResultsController do
  @moduledoc """
  This module provides the phoenix functions for the index and show pages for the find results page.
  """

  use DiscogsWeb, :controller

  alias Discogs.Search

  def index(conn, params) do
    items = Search.filter_items(params["artist_choice"], params["label_choice"], params["format_choice"], params["format_button"], params["order_button"])
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Search.get_item(id)
    render(conn, "show.html", item: item)
  end
end
