defmodule Vibble.Repo.Migrations.CreatePurchaseCounts do
  use Ecto.Migration

  def change do
    create table(:purchase_counts) do
      add :rfid, :string
      add :item_id, :integer
      add :count, :integer

      timestamps()
    end

  end
end
