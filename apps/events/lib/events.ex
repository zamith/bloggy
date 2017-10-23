defmodule Bloggy.Events do
  defmodule DraftCreated, do: defstruct [:article_id, :title, :body, :author_id]
  defmodule ArticlePublished, do: defstruct [:article_id, :slug]
  defmodule ArticleUnpublished, do: defstruct [:article_id]
  defmodule ArticleEdited, do: defstruct [:article_id, :title, :body]
end
