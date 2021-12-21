defmodule Discogs.Repo do
  use Ecto.Repo,
    otp_app: :discogs,
    adapter: Ecto.Adapters.Postgres
end
