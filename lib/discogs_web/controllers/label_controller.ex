defmodule DiscogsWeb.LabelController do
  @moduledoc """
  This module provides the phoenix functions for the index and individuals' pages for the labels page.
  """

  use DiscogsWeb, :controller

  alias Discogs.Search

  def index(conn, _params) do
    labels = Search.list_labels_sorted()
    render(conn, "index.html", labels: labels)
  end

  def show(conn, %{"id" => id}) do
    label = Search.get_label(id)
    render(conn, "show.html", label: label)
  end
end
