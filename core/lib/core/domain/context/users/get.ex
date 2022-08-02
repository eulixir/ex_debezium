defmodule Core.Domain.Users.Get do
  alias Core.Domain.Models.User
  alias Core.Repo
  alias Core.Utils.Error

  def call(id) do
    User
    |> Repo.get(id)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, %Error{status_code: 404, message: "User not found"}}

  defp handle_get(user), do: {:ok, user}
end
