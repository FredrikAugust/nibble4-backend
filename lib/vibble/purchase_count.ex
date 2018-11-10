defmodule Vibble.PurchaseCount do
  use Ecto.Schema
  import Ecto.Changeset


  schema "purchase_counts" do
    field :count, :integer
    field :item_id, :integer
    field :pk, :integer

    timestamps()
  end

  @doc false
  def changeset(purchase_count, attrs) do
    purchase_count
    |> cast(attrs, [:pk, :item_id, :count])
    |> validate_required([:pk, :item_id, :count])
  end
end
