use Mix.Config

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :content, ecto_repos: [Bloggy.Content.Repo]

import_config "#{Mix.env}.exs"
