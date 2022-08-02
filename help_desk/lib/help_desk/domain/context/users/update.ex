defmodule HelpDesk.Domain.Users.Update do
  alias HelpDesk.Domain.Models.User
  alias HelpDesk.Domain.Users
  alias HelpDesk.Repo
  alias HelpDesk.Utils.Error

  def call(updated_params, id) do
    id
    |> Users.Get.call()
    |> handle_update(updated_params)
  end

  defp handle_update({:error, _error}, _updated_params),
    do: {:error, %Error{status_code: 404, message: "User not found"}}

  defp handle_update({:ok, user}, updated_params) do
    user
    |> User.changeset(updated_params)
    |> Repo.update()
  end
end
