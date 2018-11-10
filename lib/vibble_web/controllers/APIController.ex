defmodule VibbleWeb.APIController do
  use Phoenix.Controller

  def index(conn, %{"pk" => pk, "item" => item}) do
    json(conn, %{item: item, count: Vibble.get(pk, item)})
  end

  def update(conn, %{"pk" => pk, "item" => item, "count" => count}) do
    json(conn, %{item: item, count: Vibble.increase_tally(pk, item, count)})
  end
end
