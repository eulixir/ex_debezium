defmodule Payroll.Domain.Users.Delete do
  alias Payroll.Domain.Users
  alias Payroll.Repo
  alias Payroll.Utils.Error

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
