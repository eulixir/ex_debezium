defmodule TimeClockWeb.FallbackController do
  use TimeClockWeb, :controller

  alias TimeClock.Utils.Error
  alias TimeClockWeb.ErrorView

  def call(conn, {:error, %Error{status_code: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end
end
