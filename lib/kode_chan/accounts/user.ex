defmodule KodeChan.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    has_many :posts, KodeChan.Core.Posts

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:avatar, :name, :email])
    |> validate_required([:avatar, :name, :email])
  end
end
