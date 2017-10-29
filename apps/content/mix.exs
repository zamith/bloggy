defmodule Content.Mixfile do
  use Mix.Project

  def project do
    [
      app: :content,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :commanded, :eventstore],
      mod: {Bloggy.Content.Application, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:commanded, "~> 0.14"},
      {:commanded_eventstore_adapter, "~> 0.2"},
      {:uuid, "~> 1.1"},
      {:ecto, "~> 2.1"},
      {:events, in_umbrella: true},
    ]
  end
end
