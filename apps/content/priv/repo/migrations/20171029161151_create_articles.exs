defmodule Bloggy.Content.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table("articles", primary_key: false) do
      add :article_id, :uuid, primary_key: true
      add :title, :string, null: false
      add :body, :text, null: false
      add :author_id, :binary_id, null: false
      add :slug, :string

      timestamps()
    end
  end
end
