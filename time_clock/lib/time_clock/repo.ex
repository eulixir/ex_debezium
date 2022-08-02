defmodule TimeClock.Repo do
  use Ecto.Repo,
    otp_app: :time_clock,
    adapter: Ecto.Adapters.Postgres
end
