defmodule KodeChan.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :avatar, :string
      add :name, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
