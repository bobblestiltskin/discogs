defmodule DiscogsWeb.FormatController do
  use DiscogsWeb, :controller

  alias Discogs.Search
#  alias Discogs.Search.Format

  def index(conn, _params) do
    formats = Search.list_formats()
    render(conn, "index.html", formats: formats)
  end

  def show(conn, %{"id" => id}) do
    format = Search.get_format(id)
    render(conn, "show.html", format: format)
  end
end
