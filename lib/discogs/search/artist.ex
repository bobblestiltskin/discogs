defmodule Discogs.Search.Artist do
  use Ecto.Schema

  schema "artists" do
    field :artist, :string
    has_many :items, Discogs.Search.Item
  end
end
