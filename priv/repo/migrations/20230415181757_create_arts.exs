defmodule Nftex.Repo.Migrations.CreateArts do
  use Ecto.Migration

  def change do
    create table(:arts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :artist_name, :string
      add :description, :string
      add :price, :float
      add :hash, :string

      timestamps()
    end
  end
end
