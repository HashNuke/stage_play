defmodule StagePlay.HelloProducer do
  use GenStage
  require Logger

  def start_link(initial \\ 0) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end


  def init(state) do
    {:producer, state}
  end


  def sync_notify(event, timeout \\ 5000) do
    GenStage.call(__MODULE__, {:notify, event}, timeout)
  end


  def handle_call({:notify, event}, _from, state) do
    {:reply, :ok, [event], state} # Dispatch immediately
  end


  def handle_demand(demand, state) when demand > 0 do
    Logger.info "Handling demand: #{demand}"
    {:noreply, [], state}
  end
end
