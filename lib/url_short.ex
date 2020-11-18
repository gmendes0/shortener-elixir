defmodule UrlShort do
  @moduledoc """
  UrlShort keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_link(attrs), to: UrlShort.Link.Create, as: :call

  defdelegate show_link(hash), to: UrlShort.Link.Show, as: :call
end
