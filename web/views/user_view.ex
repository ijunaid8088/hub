defmodule Hub.UserView do
  use Hub.Web, :view

  def render("index.json", %{users: users}) do
    %{users: render_many(users, __MODULE__, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, __MODULE__, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      firstname: user.firstname,
      lastname: user.lastname,
      email: user.email,
      username: user.username,
      is_admin: user.is_admin
    }
  end
end
