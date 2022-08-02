defmodule CoreWeb.FallbackController do
  use CoreWeb, :controller

  alias Core.Utils.Error
  alias CoreWeb.ErrorView

  def call(conn, {:error, %Error{status_code: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end
end
