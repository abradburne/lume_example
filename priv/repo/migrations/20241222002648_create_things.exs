defmodule LumeExample.Repo.Migrations.CreateThings do
  use Ecto.Migration

  def change do
    create table(:things) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
