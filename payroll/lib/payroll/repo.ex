defmodule Payroll.Repo do
  use Ecto.Repo,
    otp_app: :payroll,
    adapter: Ecto.Adapters.Postgres
end
