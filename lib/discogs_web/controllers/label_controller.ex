defmodule DiscogsWeb.LabelController do
  use DiscogsWeb, :controller

  alias Discogs.Search
#  alias Discogs.Search.Label

  def index(conn, _params) do
    labels = Search.list_labels()
    render(conn, "index.html", labels: labels)
  end

  def show(conn, %{"id" => id}) do
    label = Search.get_label(id)
    render(conn, "show.html", label: label)
  end
end
