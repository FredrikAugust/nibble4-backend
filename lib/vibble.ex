defmodule Vibble do
  alias Vibble.{PurchaseCount, Repo}
  import Ecto.Query

  def increase_tally(pk, item, amount) do
    case count(pk, item) do
      nil ->
        PurchaseCount.changeset(%PurchaseCount{}, %{pk: pk, item_id: item, count: amount})
        |> Repo.insert!()
        1
      count ->
        Ecto.Changeset.change(count, count: count.count + amount)
        |> Repo.insert_or_update!()
        count.count + amount
    end
  end

  def get(pk, item) do
    case count(pk, item) do
      nil ->
        0
      count ->
        count.count
    end
  end

  defp count(pk, item) do
    Repo.one(from purchaseCount in PurchaseCount, where: purchaseCount.pk == ^pk and purchaseCount.item_id == ^item)
  end
end
