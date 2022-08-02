defmodule PayrollWeb.UsersView do
  use PayrollWeb, :view

  def render("create.json", %{user: user}), do: %{user: user}
end
