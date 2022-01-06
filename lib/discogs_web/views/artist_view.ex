defmodule DiscogsWeb.ArtistView do
  use DiscogsWeb, :view

  def discogs_link(artist_name) do
    x = artist_name |> String.replace(" ", "+")
    "https://www.discogs.com/search/?type=artist&title=#{x}"
  end
end
