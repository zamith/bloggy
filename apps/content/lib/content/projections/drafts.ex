defmodule Bloggy.Content.Projections.Drafts do
  defmodule DraftProjection do
    use Ecto.Schema

    @primary_key {:article_id, :binary_id, autogenerate: false}

    schema "articles" do
      field :title, :string
      field :body, :string
      field :author_id, :binary_id
      field :slug, :string

      timestamps()
    end
  end

  defmodule Projector do
    alias Bloggy.Content.Repo
    alias Bloggy.Events.{DraftCreated}
    alias Bloggy.Content.Projections.Drafts.DraftProjection

    use Commanded.Event.Handler,
      name: "content_drafts",
      start_from: :origin,
      consistency: :strong

    def handle(%DraftCreated{article_id: article_id} = event, _meta) do
      persist_draft(event)
      :ok
    end

    defp persist_draft(%DraftCreated{} = event) do
      struct(DraftProjection, Map.from_struct(event))
      |> Repo.insert!
    end
  end

  import Ecto.Query

  alias Bloggy.Content.Repo
  alias Bloggy.Content.Projections.Drafts.DraftProjection

  def find(title: title) do
    DraftProjection
    |> Repo.get_by(title: title)
  end
end
