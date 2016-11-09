# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hub,
  ecto_repos: [Hub.Repo]

# Configures the endpoint
config :hub, Hub.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GzWqGbmrlIJOf9DvnprOMj/B3EdGj4RszvgbThB2MX268rVCJTui8IpCIfpEcv65",
  render_errors: [view: Hub.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hub.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
