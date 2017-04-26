# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :stage_play,
  ecto_repos: [StagePlay.Repo]

# Configures the endpoint
config :stage_play, StagePlay.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BnOdPl3i+lET3dPqIhiuqd6GausLvS0wvU0y3iE+WxkV4WDllrhOOiCzHtQkqbKn",
  render_errors: [view: StagePlay.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StagePlay.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
