defmodule Discogs.Search.Format do
  @moduledoc """
  This module provides the schema and changeset importer and validator function for the formats table.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "formats" do
    field :format, :string
    has_many :items, Discogs.Search.Item

    timestamps()
  end

  def changeset(data, params \\ %{}) do
    data
    |> cast(params, [:format])
    |> validate_required([:format])
  end
end
