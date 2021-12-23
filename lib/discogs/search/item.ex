defmodule Discogs.Search.Item do
  use Ecto.Schema

  schema "items" do
    field :catalogue_number, :string
    field :title, :string
    field :released, :string
    field :release_id, :integer
    belongs_to :artist, Discogs.Search.Artist
    belongs_to :label, Discogs.Search.Label
    belongs_to :format, Discogs.Search.Format
  end
end
