defmodule Discogs.Search.Artist do
  @moduledoc """
  This module provides the schema and changeset importer and validator function for the artists table.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "artists" do
    field :artist, :string
    has_many :items, Discogs.Search.Item

    timestamps()
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, [:artist])
    |> validate_required([:artist])
  end
end
