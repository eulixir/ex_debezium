defmodule CoreWeb.UsersView do
  use CoreWeb, :view

  def render("create.json", %{user: user}), do: %{user: user}
end
