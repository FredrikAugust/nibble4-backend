defmodule VibbleWeb.APIController do
  use Phoenix.Controller

  def index(conn, %{"rfid" => rfid, "item" => item}) do
    json(conn, %{count: Vibble.get(rfid, item)})
  end

  def update(conn, %{rfid: rfid, item: item}) do
    json(conn, %{count: Vibble.increaseTally(rfid, item)})
  end
end
