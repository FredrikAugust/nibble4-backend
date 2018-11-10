defmodule VibbleWeb.APIController do
  use Phoenix.Controller

  def index(conn, %{"rfid" => rfid, "item" => item}) do
    json(conn, %{item: item, count: Vibble.get(rfid, item)})
  end

  def update(conn, %{rfid: rfid, item: item}) do
    json(conn, %{item: item, count: Vibble.increase_tally(rfid, item)})
  end
end
