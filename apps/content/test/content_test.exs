defmodule ContentTest do
  use ExUnit.Case, async: false
  doctest Content

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Bloggy.Content.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Bloggy.Content.Repo, {:shared, self()})
  end

  test "creating a draft actually saves it" do
    {:ok, draft} = Content.create_draft(%{
      title: "Test Post",
      body: "To be or not to be?",
      author: "Zamith",
    })

    assert draft.title == "Test Post"
  end
end
