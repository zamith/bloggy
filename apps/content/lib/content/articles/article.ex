defmodule Bloggy.Content.Articles.Article do
  alias __MODULE__
  alias Bloggy.Content.Commands.{
    CreateDraft,
    PublishDraft,
    UnpublishArticle,
    EditArticle,
  }
  alias Bloggy.Events.{
    DraftCreated,
    ArticlePublished,
    ArticleUnpublished,
    ArticleEdited,
  }

  defstruct [:article_id, :title, :body, :slug, :author_id]

  def execute(%Article{article_id: nil}, %CreateDraft{article_id: article_id, title: title, body: body, author_id: author_id}) do
    %DraftCreated{article_id: article_id, title: title, body: body, author_id: author_id}
  end

  def apply(%Article{} = state, %DraftCreated{article_id: article_id, title: title, body: body, author_id: author_id}) do
    %{state | article_id: article_id, title: title, body: body, author_id: author_id}
  end
end
