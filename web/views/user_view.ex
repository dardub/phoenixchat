defmodule Phoenixchat.UserView do
  use Phoenixchat.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Phoenixchat.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Phoenixchat.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      username: user.username,
      first_name: user.first_name,
      last_name: user.last_name}
  end
end
