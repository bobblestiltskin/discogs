defmodule Discogs.Search do
  @moduledoc """
  The Search context.
  """

  alias Discogs.Repo
  alias Discogs.Search.Artist 
  alias Discogs.Search.Label 

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

  def get_label(id) do
    Repo.get(Label, id)
  end

  def get_label!(id) do
    Repo.get!(Label, id)
  end

  def get_label_by(params) do
    Repo.get_by(Label, params)
  end

  def list_labels do
    Repo.all(Label)
  end
end
