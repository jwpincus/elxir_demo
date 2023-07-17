defmodule DemoWeb.LightLive do
  use DemoWeb, :live_view

  def render(assigns) do
    # using the ~L sigil instead of a template. That is also an option.
    ~L"""
    <h1>Light is <%= @light_status %></h1>
    <button phx-click="on">On</button>
    <button phx-click="anything">Off</button>
    """
  end

  def mount(_params, _session, socket) do
    IO.puts("MOUNT ______________________________")

    {:ok, assign(socket, :light_status, "off")}
  end

  def handle_event("on", _value, socket) do
    IO.puts("HANDLE ON______________________________")
    socket =
      socket
      |> assign(:light_status, "on")

    {:noreply, socket}
  end

  def handle_event("anything", _value, socket) do
    IO.puts("HANDLE OFF______________________________")
    socket =
      socket
      |> assign(:light_status, "off")

    {:noreply, socket}
  end

  def handle_event(_, _, socket) do
    IO.puts("HANDLE ERROR______________________________")
    {:noreply, socket}
  end
end
