defmodule DiscogsWeb.ArtistView do
  @moduledoc """
  This module provides the view functions for the links on the the artists page.
  """

  use DiscogsWeb, :view

  def discogs_link(artist_name) do
    x = artist_name |> String.replace(" ", "+")
    "https://www.discogs.com/search/?type=artist&title=#{x}"
  end
end
