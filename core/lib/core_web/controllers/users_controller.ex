defmodule CoreWeb.UsersController do
  use CoreWeb, :controller

  alias Core.Domain.Users

  action_fallback CoreWeb.FallbackController

  def create(conn, params) do
    with {:ok, response} <- Users.Create.call(params) do
      json(conn, %{user: response})
    end
  end

  def get(conn, params) do
    with {:ok, response} <- Users.Get.call(params["id"]) do
      json(conn, %{user: response})
    end
  end

  def update(conn, params) do
    with {:ok, response} <- Users.Update.call(params, params["id"]) do
      json(conn, %{updated_user: response})
    end
  end

  def delete(conn, params) do
    with {:ok, message} <- Users.Delete.call(params["id"]) do
      json(conn, %{user: message})
    end
  end
end
