defmodule Bloggy.Content.Storage do
  def reset! do
    :ok = Application.stop(:content)
    :ok = Application.stop(:commanded)
    :ok = Application.stop(:eventstore)

    reset_eventstore()

    {:ok, _} = Application.ensure_all_started(:content)
  end

  defp reset_eventstore do
    {:ok, conn} =
      EventStore.configuration()
      |> EventStore.Config.parse()
      |> Postgrex.start_link()

    EventStore.Storage.Initializer.reset!(conn)
  end
end
