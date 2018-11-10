defmodule Vibble.Repo do
  use Ecto.Repo,
    otp_app: :vibble,
    adapter: Ecto.Adapters.Postgres
end
