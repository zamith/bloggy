use Mix.Config

config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  database: "bloggy_dev",
  hostname: "localhost",
  pool_size: 10

config :content, Bloggy.Content.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "bloggy_dev",
  hostname: "localhost",
  pool_size: 10,
  migration_source: "bloggy_schema_migrations"
