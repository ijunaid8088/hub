defmodule Hub.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :namespace, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:companies, [:user_id])

  end
end
