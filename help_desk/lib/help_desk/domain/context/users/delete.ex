defmodule HelpDesk.Domain.Users.Delete do
  alias HelpDesk.Domain.Users
  alias HelpDesk.Repo
  alias HelpDesk.Utils.Error

  def call(id) do
    id
    |> Users.Get.call()
    |> handle_delete()
  end

  defp handle_delete({:error, _error}),
    do: {:error, %Error{status_code: 404, message: "User not found"}}

  defp handle_delete({:ok, user}) do
    Repo.delete(user)
    {:ok, "The user has been deleted successfully"}
  end
end
