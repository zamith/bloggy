defmodule Bloggy.Content.Commands do
  defmodule CreateDraft, do: defstruct [:article_id, :title, :body, :author_id]
  defmodule PublishDraft, do: defstruct [:article_id, :slug]
  defmodule UnpublishArticle, do: defstruct [:article_id]
  defmodule EditArticle, do: defstruct [:article_id, :title, :body]
end
