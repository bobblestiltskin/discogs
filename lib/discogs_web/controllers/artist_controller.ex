defmodule DiscogsWeb.ArtistController do
  use DiscogsWeb, :controller

  alias Discogs.Search
  alias Discogs.Search.Artist

#  def new(conn, _params) do
#    changeset = Search.change_artist(%Artist{})
#    render(conn, "new.html", changeset: changeset)
#  end

  def index(conn, _params) do
    artists = Search.list_artists()
    render(conn, "index.html", artists: artists)
  end

#  def show(conn, %{"id" => id}) do
#    artist = Search.get_artist(id)
#    render(conn, "show.html", artist: artist)
#  end
#
#  def create(conn, %{"artist" => artist_params}) do
#   case Search.create_artist(artist_params) do
#     {:ok, artist} -> 
#       conn
#       |> put_flash(:info, "#{artist.name} created!")
#       |> redirect(to: Routes.artist_path(conn, :index))
#
#     {:error, %Ecto.Changeset{} = changeset} ->
#       render(conn, "new.html", changeset: changeset)
#   end
# end
end
