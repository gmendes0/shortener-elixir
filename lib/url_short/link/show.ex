defmodule UrlShort.Link.Show do
  alias UrlShort.{Link, Repo}
  import Ecto.Query, only: [from: 2]

  def call(hash) do
    Repo.one(from l in Link, where: l.hashed == ^hash)
  end
end
