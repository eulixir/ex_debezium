import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :payroll, Payroll.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "payroll_db",
  database: "payroll_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :payroll, PayrollWeb.Endpoint,
  http: [port: 4002],
  secret_key_base: "NZX/UChTzT3JOnL66CYeAQq4qTbhoWGirH6+PcwVTnDhv5Av8YykjwP8co5jZlST",
  server: false

# In test we don't send emails.
config :payroll, Payroll.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
