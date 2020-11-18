# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :url_short,
  ecto_repos: [UrlShort.Repo]

# Configures the endpoint
config :url_short, UrlShortWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "u+1FM0k+Lvi4vfSHPZZBulX6Mb+suCaxi9yWMcpoAeJjUlYVQil4u6bZ8/ajCG/3",
  render_errors: [view: UrlShortWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: UrlShort.PubSub,
  live_view: [signing_salt: "DYziDfgM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
