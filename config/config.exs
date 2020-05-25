# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :codegen_gen,
  ecto_repos: [CodegenGen.Repo]

# Configures the endpoint
config :codegen_gen, CodegenGenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "suFod6rjDYh5t7hM8p83mP3ISycRuvh08dlzKzqyvwIpvnofMmZJF1PDVux6CCdj",
  render_errors: [view: CodegenGenWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CodegenGen.PubSub,
  live_view: [signing_salt: "yEaF4wxq"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
