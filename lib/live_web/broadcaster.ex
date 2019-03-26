defmodule LiveWeb.Broadcaster do
  use GenServer
  def init(_key, config) do



  end

  def start_link() do

    :timer.send_interval(1000, self(), :tick)

    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def handle_info(:tick) do

    IO.puts "Tick"
    {:noreply,
      Phoenix.PubSub.broadcast(:fridge, "fridge_updates", {:take, "eggs", 3})}
  end
end
