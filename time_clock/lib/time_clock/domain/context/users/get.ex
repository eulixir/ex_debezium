defmodule TimeClock.Domain.Users.Get do
  alias TimeClock.Domain.Models.User
  alias TimeClock.Repo
  alias TimeClock.Utils.Error

  def call(id) do
    User
    |> Repo.get(id)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, %Error{status_code: 404, message: "User not found"}}

  defp handle_get(user), do: {:ok, user}
end
