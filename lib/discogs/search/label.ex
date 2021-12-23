defmodule Discogs.Search.Label do
  use Ecto.Schema

  schema "labels" do
    field :label, :string
    has_many :items, Discogs.Search.Item
  end
end
