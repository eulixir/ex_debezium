defmodule PayrollWeb.FallbackController do
  use PayrollWeb, :controller

  alias Payroll.Utils.Error
  alias PayrollWeb.ErrorView

  def call(conn, {:error, %Error{status_code: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end
end
