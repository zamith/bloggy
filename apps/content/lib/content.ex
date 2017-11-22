defmodule Content do
  alias Bloggy.Content.Router
  alias Bloggy.Content.Projections.{Drafts}
  alias Bloggy.Content.Commands.{
    CreateDraft,
  }

  def create_draft(article_attributes) do
    article_id = UUID.uuid4()
    author_id = author(article_attributes.author)
    attrs = Map.merge(
      article_attributes,
      %{article_id: article_id, author_id: author_id}
    )

    with :ok <- struct(CreateDraft, attrs) |> Router.dispatch(consistency: :strong) do
      {:ok, find_draft(title: attrs.title)}
    else
      reply -> reply
    end
  end

  def find_draft(fields) do
    Drafts.find(fields)
  end

  defp author("Zamith") do
    UUID.uuid4()
  end
  defp author(_), do: nil
end
