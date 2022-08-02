import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :time_clock, TimeClock.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "time_clock_db",
  database: "time_clock_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :time_clock, TimeClockWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "wmlp4Y1M98g4xptrPLZz4sof47m0EFrNQlSdeLrsPOslOyHI6m2cDoVVyI0IwS8r",
  server: false

# In test we don't send emails.
config :time_clock, TimeClock.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
