defmodule UrlShort.Repo do
  use Ecto.Repo,
    otp_app: :url_short,
    adapter: Ecto.Adapters.Postgres
end
