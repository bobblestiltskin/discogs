defmodule Discogs.Search do
  @moduledoc """
  The Search context.
  """

  alias Discogs.Repo
  alias Discogs.Search.Artist 

  def get_artist(id) do
    Repo.get(Artist, id)
  end
 	
  def get_artist!(id) do
    Repo.get!(Artist, id)
  end
 	
  def get_artist_by(params) do
    Repo.get_by(Artist, params)
  end
 	
  def list_artists do
    Repo.all(Artist)
  end
end
