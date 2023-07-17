defmodule DemoWeb.ClockLive do
  use DemoWeb, :live_view

  def render(assigns) do
    ~L"""
    <h1>Time is <%= @time %></h1>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1, self(), :tick)
    end
    IO.puts("MOUNT ______________________________")
    socket = socket
    |> assign(time: Time.utc_now()
    |> Time.to_string())
    {:ok, socket}
  end

  def handle_info(:tick, socket) do
    IO.puts("HANDLE INFO______________________________")
    socket =
      socket
      |> assign(time: Time.utc_now()
      |> Time.to_string())

    {:noreply, socket}
  end

end
