defmodule Nftex.Repo do
  use Ecto.Repo,
    otp_app: :nftex,
    adapter: Ecto.Adapters.Postgres
end
