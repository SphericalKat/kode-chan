defmodule KodeChan.Repo do
  use Ecto.Repo,
    otp_app: :kode_chan,
    adapter: Ecto.Adapters.Postgres
end
