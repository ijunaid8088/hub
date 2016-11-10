defmodule Hub.CompanyView do
  use Hub.Web, :view

  def render("show.json", %{company: company}) do
    %{company: render_one(company, Hub.CompanyView, "company.json")}
  end

  def render("company.json", %{company: company}) do
    %{
      id: company.id,
      name: company.name,
      namespace: company.namespace,
      user_id: company.user_id
    }
  end
end
