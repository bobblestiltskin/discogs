defmodule DiscogsWeb.PageController do
  use DiscogsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
