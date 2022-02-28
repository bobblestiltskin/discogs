defmodule DiscogsWeb.ItemController do
  @moduledoc """
  This module provides the phoenix index function for items page.
  """

  use DiscogsWeb, :controller

  def index(conn, _params) do
    items = Discogs.Search.list_items()
    render(conn, "index.html", items: items)
  end
end
