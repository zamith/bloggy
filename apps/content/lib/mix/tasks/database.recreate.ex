defmodule Mix.Tasks.Database.Recreate do
  use Mix.Task

  def run(_) do
    Mix.Tasks.EventStore.Drop.run([])
    Mix.Tasks.Ecto.Drop.run([])

    Mix.Tasks.EventStore.Create.run([])
    Mix.Tasks.EventStore.Init.run([])
    Mix.Tasks.Ecto.Create.run([])
    Mix.Tasks.Ecto.Migrate.run([])
  end
end
