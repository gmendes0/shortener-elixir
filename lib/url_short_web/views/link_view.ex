defmodule UrlShortWeb.LinkView do
  use UrlShortWeb, :view
  alias UrlShort.Link

  # def render("show.json", %{link: %Link{} = link}) do
  #   link
  #   |> Map.delete(:__meta__)
  #   |> Map.from_struct()
  # end

  def render("show.json", %{link: nil}) do
    %{
      error: "page not found"
    }
  end

  def render("created.json", %{link: %Link{} = link}) do
    link
    |> Map.delete(:__meta__)
    |> Map.from_struct()
  end
end
