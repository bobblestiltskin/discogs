defmodule Discogs.Search do
  @moduledoc """
  The Search context.
  """

  alias Discogs.Repo
  alias Discogs.Search.Artist 
  alias Discogs.Search.Format 
  alias Discogs.Search.Item 
  alias Discogs.Search.Label 

  def get_artist(id) do
    Repo.get(Artist, id)
  end
 	
#  def get_artist_name(id) do
#    Repo.get(Artist, id).artist
##    x = Repo.get(Artist, id)
##    x.artist
#  end

  def get_artist!(id) do
    Repo.get!(Artist, id)
  end
 	
  def get_artist_by(params) do
    Repo.get_by(Artist, params)
  end

  def list_artists do
    Repo.all(Artist)
  end

  def get_format(id) do
    Repo.get(Format, id)
  end

  def get_format!(id) do
    Repo.get!(Format, id)
  end

  def get_format_by(params) do
    Repo.get_by(Format, params)
  end

  def list_formats do
    Repo.all(Format)
  end

  def get_item(id) do
    Repo.get(Item, id)
  end

  def get_item!(id) do
    Repo.get!(Item, id)
  end

  def get_item_by(params) do
    Repo.get_by(Item, params)
  end

  def list_items do
    Repo.all(Item)
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
