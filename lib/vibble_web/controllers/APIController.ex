defmodule VibbleWeb.APIController do
  use Phoenix.Controller

  def index(conn, %{"rfid" => rfid, "item" => item}) do
    json(conn, %{count: Vibble.get(rfid, item)})
  end

  def update(conn, %{rfid: rfid, item: item}) do
    json(conn, %{count: Vibble.increase_tally(rfid, item)})
  end

  def rfid_all(conn, %{"rfid" => rfid}) do
    json(conn, Vibble.rfid_all(rfid))
  end
end
