defmodule Bloggy.Content.Application do
  use Application

  def start(_type, _args) do
    Bloggy.Content.Supervisor.start_link()
  end
end
