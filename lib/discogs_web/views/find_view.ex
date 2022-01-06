defmodule DiscogsWeb.FindView do
  use DiscogsWeb, :view

#  alias Discogs.Search

  def display_option(artist) do
    "<option value=\"#{Integer.to_string(artist.id)}\">#{artist.artist}</option>"
  end
end
