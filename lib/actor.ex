defmodule ActorCluster.Worker do
  use GenServer
  require Logger

  # Client API
  def start_link(name, init_state \\ %{}) do
    GenServer.start_link(__MODULE__, init_state, name: via_tuple(name))
  end

  def get_state(name) do
    GenServer.call(via_tuple(name), :get_state)
  end

  def set_state(name, key, val) do
    GenServer.call(via_tuple(name), {:set_state, key, val})
  end

  def async_notify(name, event) do
    GenServer.cast(via_tuple(name), {:event, event})
  end

  # Server Callbacks
  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:set_state, key, val}, _from, state) do
    new_state = Map.put(state, key, val)
    {:reply, :ok, new_state}
  end

  @impl true
  def handle_cast({:event, event}, state) do
    new_state = Map.update(state, :events, [event], fn list -> [event | list] end)
    {:noreply, new_state}
  end

  defp via_tuple(name) do
    {:global, {:actor, name}}
  end
end
