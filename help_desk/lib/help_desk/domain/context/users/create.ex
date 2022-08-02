defmodule HelpDesk.Domain.Users.Create do
  alias HelpDesk.Domain.Models.User
  alias HelpDesk.Repo
  alias HelpDesk.Utils.Error

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:error, reason}), do: {:error, %Error{status_code: 422, message: reason}}

  defp handle_insert({:ok, user}), do: {:ok, user}
end
