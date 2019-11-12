# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :lamp_web_ui, LampWebUiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3IYvWPyPhkQhrUDqxEdlEI9K9nmyfspwZ9asn9vcv5bxyffVZXdbR0iur8GEMF02",
  render_errors: [view: LampWebUiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: LampWebUi.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [ signing_salt: System.get_env("SIGNING_SALT") || "NERVES_LAMP_PROJECT" ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
