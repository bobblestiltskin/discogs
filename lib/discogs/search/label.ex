defmodule Discogs.Search.Label do
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
