defmodule DiscogsWeb.FindView do
  use DiscogsWeb, :view

  alias Discogs.Search

#  def name(%Search.Search{artist: artist}) do
#    artist
#  end

  def display_option(artist) do
    "<option value=\"#{Integer.to_string(artist.id)}\">#{artist.artist}</option>"
  end
end
