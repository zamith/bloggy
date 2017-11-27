use Mix.Config

config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :content, Bloggy.Content.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  migration_source: "bloggy_schema_migrations"
