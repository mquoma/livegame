defmodule LiveWeb.GameView do
  use Phoenix.LiveView

  def render(assigns) do
    # render_button(assigns |> IO.inspect(label: "this is assigns"))
    render_table(assigns |> IO.inspect(label: "this is assigns"))
    # h1(assigns, "class=active", "Hello")
  end

  def mount(_session, socket) do
    Phoenix.PubSub.subscribe(:fridge, "fridge_updates")

    {:ok, assign(socket, step: get_step())}
  end

  def handle_event("go", _value, socket) do

    {:noreply, assign(socket, step: get_step())}

  end

  def get_step do
    Enum.random(1..10)
  end

  defp render_button(assigns)  do
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

  def h1(assigns, attrs, htmls) do
    node(assigns, "h1", attrs, htmls)
  end
  defp node(assigns, tag, attrs, htmls) do

    ~L"""
      <#{tag}>hi.</h1>
      """

  end

  defp render_table(assigns) do

    h1 = "<h1>H1</h1>"
    ~L"""
    <%= h1 %>
    <table class="">
      <table>
        <tr>
          <th>Left</th>
          <th>Right</th>
        </tr>
        <%= for i <- 1..@step do %>
          <tr>
            <td>
              0
            </td>
            <td>
              1
            </td>
          </tr>
        <%= end %>
    </table>
    """ |> IO.inspect(label: "L")
  end

end
