defmodule UrlShort.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :original, :string, size: 255
    field :hashed, :string, size: 20
    field :clicks, :integer, default: 0

    timestamps()
  end

  def build(attrs) do
    changeset(%UrlShort.Link{}, attrs)
    |> apply_action(:insert)
  end

  @doc false
  def changeset(%UrlShort.Link{} = link, attrs) do
    link
    |> cast(attrs, [:original])
    |> validate_required([:original])
    |> hash_link()
  end

  defp hash_link(%Ecto.Changeset{valid?: true, changes: %{original: original}} = changeset) do
    <<hashed::binary-size(5), _::binary()>> =
      :blake2b
      |> :crypto.hash(original)

    change(changeset, %{
      hashed:
        hashed
        |> Base.encode16(case: :lower)
    })
  end

  defp hash_link(%Ecto.Changeset{} = changeset), do: changeset
end
