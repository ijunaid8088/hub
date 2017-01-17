defmodule Hub.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_login, :boolean, default: true
    end
  end
end
