use Mix.Config

config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  database: "bloggy_test",
  hostname: "localhost",
  pool_size: 10,
  pool: Ecto.Adapters.SQL.Sandbox

config :content, Bloggy.Content.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "bloggy_test",
  hostname: "localhost",
  pool_size: 10,
  migration_source: "bloggy_schema_migrations",
  pool: Ecto.Adapters.SQL.Sandbox
