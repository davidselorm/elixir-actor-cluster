defmodule ActorCluster.MixProject do
  use Mix.Project
  def project do
    [app: :actor_cluster, version: "0.1.0", elixir: "~> 1.15"]
  end
  def application do
    [extra_applications: [:logger]]
  end
end
