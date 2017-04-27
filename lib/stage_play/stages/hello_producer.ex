defmodule StagePlay.HelloProducer do
  use GenStage
  require Logger

  def start_link(initial \\ 0) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end


  def init(state) do
    {:producer, state}
  end


  # Handle events to dispatch immediately
  def handle_call({:notify, event}, _from, state) do
    {:reply, :ok, [event], state}
  end


  # Check buffer for demand and return events
  def handle_demand(demand, state) when demand > 0 do
    Logger.info "Handling demand: #{demand}"
    {:noreply, [], state}
  end
end
