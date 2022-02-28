defmodule DiscogsWeb.PageController do
  @moduledoc """
  This module provides the phoenix index function for the main page.
  """

  use DiscogsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
