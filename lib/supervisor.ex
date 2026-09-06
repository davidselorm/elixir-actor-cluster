defmodule ActorCluster.Supervisor do
  use DynamicSupervisor
  def start_link(init_arg), do: DynamicSupervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  def init(_init_arg), do: DynamicSupervisor.init(strategy: :one_for_one)
  def start_worker(id) do
    spec = {ActorCluster.Worker, id}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end
end
