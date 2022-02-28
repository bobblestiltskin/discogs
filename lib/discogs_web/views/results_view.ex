defmodule DiscogsWeb.ResultsView do
  @moduledoc """
  This module provides the view functions (db lookups and link generation) for the results page.
  """

  use DiscogsWeb, :view

  alias Discogs.Search

  def artist_name(artist_id) do
    Search.get_artist(artist_id).artist
  end

  def format_name(format_id) do
    Search.get_format(format_id).format
  end

  def label_name(label_id) do
    Search.get_label(label_id).label
  end

  def discogs_link(item_name, artist_name, label_name) do
    x = item_name |> String.replace(" ", "+")
    y = artist_name |> String.replace(" ", "+")
    z = label_name |> String.replace(" ", "+")
    "https://www.discogs.com/search/?type=all&title=#{x}&artist=#{y}&label=#{z}"
  end
end
