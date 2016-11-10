defmodule Hub.UserView do
  use Hub.Web, :view

  def render("show.json", %{user: user}) do
    %{user: render_one(user, Hub.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      firstname: user.firstname,
      lastname: user.lastname,
      email: user.email,
      company_name: user.company_name,
      company_url: user.company_url,
      company_role: user.company_role,
      username: user.username
    }
  end
end
