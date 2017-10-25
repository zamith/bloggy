defmodule Bloggy.Content.Router do
  alias Bloggy.Content.Commands.{
    CreateDraft,
    PublishDraft,
    UnpublishArticle,
    EditArticle,
  }
  alias Bloggy.Content.Articles.Article

  use Commanded.Commands.Router

  dispatch [
    CreateDraft,
    PublishDraft,
    UnpublishArticle,
    EditArticle,
  ], to: Article, identity: :article_id
end
