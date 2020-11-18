defmodule UrlShortWeb.FallbackController do
  use UrlShortWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(400)
    |> put_view(UrlShortWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
