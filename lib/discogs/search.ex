defmodule Discogs.Search do
  @moduledoc """
  This module provides all the functions for interacting with the database using Ecto.
  """

  alias Discogs.Repo
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

  def list_artists_sorted do
    query = from a in Artist, order_by: a.artist
    Repo.all(query)
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

  def list_formats_sorted do
    query = from f in Format, order_by: f.format
    Repo.all(query)
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
    Item
      |> join(:left, [i], a in Artist, on: i.artist_id == a.id)
      |> order_by([i,a], [a.artist, i.title])
      |> Repo.all()
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

  def list_labels_sorted do
    query = from l in Label, order_by: l.label
    Repo.all(query)
  end

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

  def filter_by_format(query, format_choice, _format_button) when is_bitstring(format_choice) and byte_size(format_choice) > 0 do
    format_id = String.to_integer(format_choice)
    query |> where(format_id: ^format_id)
  end

  def filter_by_format(query, _format_choice, format_button) when is_bitstring(format_button) and byte_size(format_button) > 0 do
    format_selector = "%#{format_button}%"
    subquery = from(f in Format,
               where: like(f.format, ^format_selector),
               select: f.id)
    sqr = Repo.all(subquery)
    query |> where([i], i.format_id in ^sqr)
  end

  def filter_by_format(query, _format_choice, _format_button) do
    query
  end

  def order_by_x(query, order_button) when is_bitstring(order_button) and byte_size(order_button) > 0  and order_button == "artist_id" do
    query
      |> join(:left, [i], a in Artist, on: i.artist_id == a.id)
      |> order_by([i,a], asc: a.artist)
  end

  def order_by_x(query, order_button) when is_bitstring(order_button) and byte_size(order_button) > 0 and order_button == "title" do
    query
      |> order_by([i], asc: i.title)
  end

  def order_by_x(query, order_button) when is_bitstring(order_button) and byte_size(order_button) > 0 and order_button == "label_id" do
    query
      |> join(:left, [i], l in Label, on: i.label_id == l.id)
      |> order_by([i,l], asc: l.label)
  end

  def order_by_x(query, _order_button) do
    query
      |> join(:left, [i], a in Artist, on: i.artist_id == a.id)
      |> join(:left, [i], l in Label, on: i.label_id == l.id)
      |> order_by([i,a,l], [a.artist, i.title, l.label]) # order by artist, title, label if no ordering selected
  end

  def filter_items(artist_choice, label_choice, format_choice, format_button, order_button) do
    Item
      |> filter_by_artist(artist_choice)
      |> filter_by_label(label_choice)
      |> filter_by_format(format_choice, format_button)
      |> order_by_x(order_button)
      |> Repo.all
  end

end
