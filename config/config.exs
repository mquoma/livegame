# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :live,
  ecto_repos: [Live.Repo]

config :live, LiveWeb.Endpoint,
  live_view: [
    signing_salt: "PP5WcVN10ektHSkQIPGybi0d5bBwBPjU"
  ]

config :phoenix,
  template_engines: [leex: Phoenix.LiveView.Engine]

# Configures the endpoint
config :live, LiveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RlQ6GTmOit/6btRSdCuzovCG2lNPFDZeQpCrT1LKRwyfZ4GwPx97Dc34L24fy+8i",
  render_errors: [view: LiveWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Live.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
