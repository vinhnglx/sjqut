defmodule Sjqut.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :film_title, :string
      add :content, :text

      timestamps()
    end
  end
end
