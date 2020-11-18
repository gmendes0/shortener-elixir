defmodule UrlShort.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :original, :string, size: 255, null: false
      add :hashed, :string, size: 20, null: false
      add :clicks, :integer, default: 0, null: false

      timestamps()
    end

  end
end
