defmodule KodeChan.Core.Posts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :title, :string
    # field :user_id, :id
    belongs_to :user, KodeChan.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(posts, attrs) do
    posts
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
    |> validate_length(:title, min: 5)
    |> validate_length(:content, min: 20)
  end
end
