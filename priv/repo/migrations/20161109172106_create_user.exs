defmodule Hub.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :company_name, :string
      add :company_url, :string
      add :company_role, :string
      add :api_id, :string
      add :api_key, :string
      add :password, :string

      timestamps()
    end

  end
end
