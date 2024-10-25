defmodule Animeview.Repo do
  use Ecto.Repo,
    otp_app: :animeview,
    adapter: Ecto.Adapters.SQLite3
end
