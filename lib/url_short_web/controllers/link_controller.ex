defmodule UrlShortWeb.LinkController do
  use UrlShortWeb, :controller
  alias UrlShort.Link

  action_fallback UrlShortWeb.FallbackController

  def show(conn, %{"hash" => hash} = _params) do
    link = UrlShort.show_link(hash)

    case link do
      %Link{} ->
        conn
        |> put_status(:permanent_redirect)
        |> redirect(external: link.original)

      nil ->
        conn
        |> put_status(:not_found)
        |> render("show.json", link: link)
    end
  end

  def create(conn, params) do
    params
    |> UrlShort.create_link()
    |> handle_create_response(conn)
  end

  defp handle_create_response({:ok, struct}, %Plug.Conn{} = conn) do
    conn
    |> put_status(:created)
    |> render("created.json", link: struct)
  end

  defp handle_create_response({:error, _} = error, _conn), do: error
end
