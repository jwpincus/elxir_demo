defmodule DemoWeb.PageController do
  use DemoWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def hello_world(conn, _params) do
    render(conn, :hello_world)
  end

  def inspect(conn, _params) do
    conn
    |> assign(:assigned_value, "You can assign anything here")
    |> render(:inspect, assigned_value: "overwrite", layout: false)
  end
end
