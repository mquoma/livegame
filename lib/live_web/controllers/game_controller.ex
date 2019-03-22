defmodule LiveWeb.GameController do
  use LiveWeb, :controller

  def index(conn, _params) do
     Phoenix.LiveView.Controller.live_render(conn, LiveWeb.GameView, session: %{})
  end
end
