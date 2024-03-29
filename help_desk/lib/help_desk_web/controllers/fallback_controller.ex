defmodule HelpDeskWeb.FallbackController do
  use HelpDeskWeb, :controller

  alias HelpDesk.Utils.Error
  alias HelpDeskWeb.ErrorView

  def call(conn, {:error, %Error{status_code: status, message: message}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", message: message)
  end
end
