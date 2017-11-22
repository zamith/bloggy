defmodule BlogWeb.PageController do
  use BlogWeb, :controller

  def index(conn, _params) do
    articles = Content.drafts
    render conn, "index.html", articles: articles
  end
end
