defmodule VibbleWeb.PageController do
  use VibbleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
