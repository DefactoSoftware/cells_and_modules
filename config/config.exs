# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :cells_and_modules, CellsAndModulesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hczRvwRv2DVwbWkgvOgVybvXZq7X7TrA2lv7Mtb0K003iYCge6Hu3ue9rIOXeU54",
  render_errors: [view: CellsAndModulesWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CellsAndModules.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
