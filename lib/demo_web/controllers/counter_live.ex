defmodule DemoWeb.CounterLive do
  use DemoWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :counter, 0)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <h1>Current count: <%= @counter %></h1>
    <button phx-click="inc" phx-value="inc">+1</button>
    <button phx-click="reset">Reset</button>
    """
  end

  def handle_event("inc", _, socket) do
    IO.inspect(socket)
    socket = update(socket, :counter, &(&1 + 1))
    {:noreply, socket}
  end

  def handle_event("reset", _, socket) do
    socket = assign(socket, :counter, 0)
    {:noreply, socket}
  end
end
