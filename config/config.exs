# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :animeview,
  ecto_repos: [Animeview.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :animeview, AnimeviewWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: AnimeviewWeb.ErrorHTML, json: AnimeviewWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Animeview.PubSub,
  live_view: [signing_salt: "DujUj94n"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :animeview, Animeview.Mailer, adapter: Swoosh.Adapters.Local

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  animeview: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
