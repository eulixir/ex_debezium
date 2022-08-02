defmodule TimeClock.Domain.Users.Create do
  alias TimeClock.Domain.Models.User
  alias TimeClock.Repo
  alias TimeClock.Utils.Error

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:error, reason}), do: {:error, %Error{status_code: 422, message: reason}}

  defp handle_insert({:ok, user}), do: {:ok, user}
end
