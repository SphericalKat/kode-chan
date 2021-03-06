# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kode_chan,
  ecto_repos: [KodeChan.Repo]

# Configures the endpoint
config :kode_chan, KodeChanWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZsiDm6psmCCEL4OSyP7K6iSxq02tww9NaW1y0vDWTnidUuP//bBSGecjW7qYhKg7",
  render_errors: [view: KodeChanWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: KodeChan.PubSub,
  live_view: [signing_salt: "L9ogbFWM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


import_config "ueberauth.exs"
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
