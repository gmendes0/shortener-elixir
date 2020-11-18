defmodule UrlShort.Link.Create do
  alias UrlShort.{Link, Repo}
  import Ecto.Query, only: [from: 2]

  def call(attrs) do
    attrs
    |> Link.build()
    |> create_link()
  end

  defp create_link({:ok, %Link{} = struct}) do
    case fetch_link(struct) do
      true ->
        {:ok, struct}

      false ->
        struct
        |> Repo.insert()
    end
  end

  defp create_link({:error, _changeset} = error), do: error

  defp fetch_link(%Link{hashed: hashed}) do
    Repo.exists?(from l in Link, where: l.hashed == ^hashed)
  end
end
