defmodule HelpDeskWeb.UsersView do
  use HelpDeskWeb, :view

  def render("create.json", %{user: user}), do: %{user: user}
end
