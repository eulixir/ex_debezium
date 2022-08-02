defmodule Core.Domain.Users.Create do
  alias Core.Domain.Models.User
  alias Core.Repo
  alias Core.Utils.Error

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:error, reason}), do: {:error, %Error{status_code: 422, message: reason}}

  defp handle_insert({:ok, user}), do: {:ok, user}
end
