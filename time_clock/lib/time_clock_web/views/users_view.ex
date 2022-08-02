defmodule TimeClockWeb.UsersView do
  use TimeClockWeb, :view

  def render("create.json", %{user: user}), do: %{user: user}
end
