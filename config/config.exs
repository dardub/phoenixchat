# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenixchat,
  ecto_repos: [Phoenixchat.Repo]

# Configures the endpoint
config :phoenixchat, Phoenixchat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "s5vK/JgeJBNaSZCVxMUYuOpmJkPnitPm6nDpLLdYXjOF/u5uIpJkTLLay6b7gu8W",
  render_errors: [view: Phoenixchat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phoenixchat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
