defmodule Discogs.Repo.Migrations.Initial do
  use Ecto.Migration

  def change do
    create table ("artists") do
      add :artist, :string

      timestamps()
    end
#    create unique_index(:artists, [:artist])

    create table ("labels") do
      add :label, :string

      timestamps()
    end
#    create unique_index(:labels, [:label])

    create table ("formats") do
      add :format, :string

      timestamps()
    end
#    create unique_index(:formats, [:format])

    create table ("items") do
      add :catalogue_number, :string
      add :title, :string
      add :released, :string
      add :release_id, :integer
      add :artist_id, references (:artists)
      add :label_id, references (:labels)
      add :format_id, references (:formats)

      timestamps()
    end

  end
end
