defmodule Content do
  alias Bloggy.Content.Router
  alias Bloggy.Content.Commands.{
    CreateDraft,
  }

  def create_draft(article_attributes) do
    article_id = UUID.uuid4()
    attrs = Map.merge(article_attributes, %{article_id: article_id})

    struct(CreateDraft, attrs)
    |> Router.dispatch
  end

  def find_draft(fields) do
  end
end
