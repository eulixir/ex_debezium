defmodule Payroll.Domain.Users.Update do
  alias Payroll.Domain.Models.User
  alias Payroll.Domain.Users
  alias Payroll.Repo
  alias Payroll.Utils.Error

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
