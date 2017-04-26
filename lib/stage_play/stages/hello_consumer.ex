defmodule StagePlay.HelloConsumer do
  require Logger
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, :any_state)
  end


  def init(state) do
    {:consumer, state, subscribe_to: [StagePlay.HelloProducer]}
  end


  def handle_events(events, _from, state) do
    Logger.info("Received batch of events")

    Enum.map(events, fn(event)->
      {self(), event, state}
      |> IO.inspect()
    end)

    {:noreply, [], state}
  end

end