defmodule NftexWeb.Schema.Types.Custom.UUID4 do
  use Absinthe.Schema.Notation

  alias Ecto.UUID

  scalar :uuid4, name: "UUID4" do
    description("""
    The `UUID4` scalar type represents UUID4 compliant string data, represented as UTF-8
    character sequences. The UUID4 type is most often used to represent unique
    human-readable ID strings.
    """)

    serialize(&encode/1)
    parse(&decode/1)
  end

  @spec decode(Absinthe.Blueprint.Input.String.t()) :: {:ok, term()} | :error
  @spec decode(Absinthe.Blueprint.Input.Null.t()) :: {:ok, nil}
  defp decode(%Absinthe.Blueprint.Input.String{value: value}) do
    UUID.cast(value)
  end

  defp decode(%Absinthe.Blueprint.Input.Null{}) do
    {:ok, nil}
  end

  defp decode(_), do: :error

  defp encode(value), do: value
end
