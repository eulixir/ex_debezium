defmodule Payroll.Domain.Users.Get do
  alias Payroll.Domain.Models.User
  alias Payroll.Repo
  alias Payroll.Utils.Error

  def call(id) do
    User
    |> Repo.get(id)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, %Error{status_code: 404, message: "User not found"}}

  defp handle_get(user), do: {:ok, user}
end
