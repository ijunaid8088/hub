defmodule Hub.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstname, :string
      add :lastname, :string
      add :username, :string
      add :email, :string
      add :token, :string
      add :password, :string
      add :is_admin, :boolean, default: true

      timestamps()
    end

  end
end
