defmodule DiscogsWeb.FormatController do
  @moduledoc """
  This module provides the phoenix functions for the index page for the format page.
  """

  use DiscogsWeb, :controller

  def index(conn, _params) do
    formats = Discogs.Search.list_formats_sorted()
    render(conn, "index.html", formats: formats)
  end
end
