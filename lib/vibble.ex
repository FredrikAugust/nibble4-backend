defmodule Vibble do
  alias Vibble.{PurchaseCount, Repo}
  import Ecto.Query

  def increase_tally(rfid, item) do
    count = count(rfid, item)
    case count do
      nil ->
        PurchaseCount.changeset(%PurchaseCount{}, %{rfid: rfid, item_id: item, count: 1})
        |> Repo.insert()
        1
      _ ->
        PurchaseCount.changeset(count, %{count: count.count + 1})
        |> Repo.update()
        count.count + 1
    end
  end

  def get(rfid, item) do
    count(rfid, item) || 0
  end

  def rfid_all(rfid) do
    Repo.all(from purchaseCount in PurchaseCount, where: purchaseCount.rfid == ^rfid)
  end

  defp count(rfid, item) do
    Repo.one(from purchaseCount in PurchaseCount, where: purchaseCount.rfid == ^rfid and purchaseCount.item == ^item)
  end
end
