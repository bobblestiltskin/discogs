defmodule Discogs.Search do
  @moduledoc """
  The Search context.
  """

  alias Discogs.Repo
#  import Ecto.Query, only: [from: 2]
  import Ecto.Query
  alias Discogs.Search.Artist 
  alias Discogs.Search.Format 
  alias Discogs.Search.Item 
  alias Discogs.Search.Label 

  def get_artist(id) do
    Repo.get(Artist, id)
  end
 	
  def get_artist_name(id) do
    Repo.get(Artist, id).artist
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

#  def get_items_by_artist(artist_choice) do
#    Item |> Ecto.Query.where(artist_id: ^artist_choice) |> Repo.all
#  end

  def filter_by_artist(query, artist_choice) when is_bitstring(artist_choice) and byte_size(artist_choice) > 0 do
    artist_id = String.to_integer(artist_choice)
    query |> where(artist_id: ^artist_id)
  end

  def filter_by_artist(query, _artist_choice) do
    query
  end

  def filter_by_label(query, label_choice) when is_bitstring(label_choice) and byte_size(label_choice) > 0 do
    label_id = String.to_integer(label_choice)
    query |> where(label_id: ^label_id)
  end

  def filter_by_label(query, _label_choice) do
    query
  end

#  def format_like(_query, format_button) do
#    like = "%#{format_button}%"
#    Repo.all(from f in Format, where: like(f.format, ^like))
#  end

  def filter_by_format(query, format_choice, _format_button) when is_bitstring(format_choice) and byte_size(format_choice) > 0 do
    format_id = String.to_integer(format_choice)
    query |> where(format_id: ^format_id)
  end

  def filter_by_format(query, _format_choice, format_button) when is_bitstring(format_button) and byte_size(format_button) > 0 do
    mike = "%#{format_button}%"
    subquery = from(f in Format,
               where: like(f.format, ^mike),
               select: f.id)
    sqr = Repo.all(subquery)
    query |> where([i], i.format_id in ^sqr)
  end

  def filter_by_format(query, _format_choice, _format_button) do
    query
  end

  def filter_items(artist_choice, label_choice, format_choice, format_button) do
    Item
      |> filter_by_artist(artist_choice)
      |> filter_by_label(label_choice)
      |> filter_by_format(format_choice, format_button)
      |> Repo.all
  end

end
