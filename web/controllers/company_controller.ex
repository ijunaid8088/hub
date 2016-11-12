defmodule Hub.CompanyController do
  use Hub.Web, :controller

  alias Hub.Company

  def create(conn, company_params) do
    changeset = Company.changeset(%Company{}, company_params)

    case Repo.insert(changeset) do
      {:ok, company} ->
        conn
        |> put_status(:created)
        |> render("show.json", company: company)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Hub.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
