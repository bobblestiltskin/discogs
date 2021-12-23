defmodule Discogs.Search.Format do
  use Ecto.Schema

  schema "formats" do
    field :format, :string
    has_many :items, Discogs.Search.Item
  end
end
