defmodule KodeChan.Core.Posts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(posts, attrs) do
    posts
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
  end
end
