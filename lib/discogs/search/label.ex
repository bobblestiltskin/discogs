defmodule Discogs.Search.Label do
  @moduledoc """
  This module provides the schema and changeset importer and validator function for the labels table.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "labels" do
    field :label, :string
    has_many :items, Discogs.Search.Item

    timestamps()
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, [:label])
    |> validate_required([:label])
  end
end
