defmodule Discogs.Search.Artist do
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
