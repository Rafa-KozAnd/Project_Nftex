defmodule Nftex.Arts.Create do
  alias Nftex.{Repo, Art}

  def call(params) do
    params
    |> Art.changeset()
    |> Repo.insert()
  end
end
