defmodule DiscogsWeb.FormatController do
  use DiscogsWeb, :controller

  def index(conn, _params) do
    formats = Discogs.Search.list_formats()
    render(conn, "index.html", formats: formats)
  end
end
