defmodule Discogs.Search.Item do
  @moduledoc """
  This module provides the schema and changeset importer and validator function for the items table.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :catalogue_number, :string
    field :title, :string
    field :released, :string
    field :release_id, :integer
    belongs_to :artist, Discogs.Search.Artist
    belongs_to :label, Discogs.Search.Label
    belongs_to :format, Discogs.Search.Format

    timestamps()
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, [:catalogue_number, :title, :released, :release_id, :artist_id, :label_id, :format_id])
    |> validate_required([:catalogue_number])
    |> validate_required([:title])
    |> validate_required([:release_id])
    |> validate_number(:artist_id, greater_than: 0)
    |> validate_number(:label_id, greater_than: 0)
    |> validate_number(:format_id, greater_than: 0)
    |> validate_number(:release_id, greater_than: 0)
  end
end
