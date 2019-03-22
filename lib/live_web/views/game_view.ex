defmodule LiveWeb.GameView do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div class="">
      <div>
        <div>
          <button phx-click="go">GO</button>
        </div>
          <%= for i <- 1..@step do %>
            <span>X</span>
          <%= end %>
      </div>
    </div>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, step: 1)}
  end

  def handle_event("go", _value, socket) do

    {:noreply, assign(socket, step: get_step())}

  end

  def get_step do
    Enum.random(1..100)
  end
end
