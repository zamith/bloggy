defmodule ContentTest do
  use ExUnit.Case
  doctest Content

  test "creating a draft" do
    draft = Content.create_draft(%{
      title: "Test Post",
      body: "To be or not to be?",
      author: "Zamith",
    })

    assert Content.find_article(draft.article_id) == draft
  end
end
