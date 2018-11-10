defmodule Vibble.PurchaseCount do
  use Ecto.Schema
  import Ecto.Changeset


  schema "purchase_counts" do
    field :count, :integer
    field :item_id, :integer
    field :rfid, :string

    timestamps()
  end

  @doc false
  def changeset(purchase_count, attrs) do
    purchase_count
    |> cast(attrs, [:rfid, :item_id, :count])
    |> validate_required([:rfid, :item_id, :count])
  end
end
