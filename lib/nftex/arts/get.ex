defmodule Nftex.Arts.Get do
  alias Nftex.{Repo, Art}

  def call(id) do
    id
    |> Ecto.UUID.cast()
    |> handle_cast()
  end

  defp handle_cast({:ok, id}) do
    case Repo.get(Art, id) do
      nil -> {:error, "Art not found"}
      art -> {:ok, art}
    end
  end

  defp handle_cast(:error), do: {:error, "Invalid UUID"}
end
