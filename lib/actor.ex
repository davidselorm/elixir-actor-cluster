defmodule ActorCluster.Worker do
  use GenServer
  def start_link(id), do: GenServer.start_link(__MODULE__, id, name: via_tuple(id))
  def init(id), do: {:ok, %{id: id, state: :idle}}
  def handle_call(:status, _from, state), do: {:reply, state, state}
  defp via_tuple(id), do: {:global, {:worker, id}}
end
