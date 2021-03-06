defmodule KodeChanWeb.IndexLive do
  import KodeChanWeb.ErrorHelpers
  use KodeChanWeb, :live_view
  use Phoenix.HTML
  alias KodeChan.Accounts
  alias KodeChan.Core
  alias KodeChan.Core.Posts
  require Logger
  require Jason

  def mount(_params, %{"user_id" => user_id}, socket) do
    {:ok,
     assign(socket, %{
       current_user: Accounts.get_user_from_id(user_id),
       changeset: Core.change_posts(%Posts{}),
       posts: Core.list_posts()
     })}
  end

  def handle_event("validate", %{"posts" => params}, socket) do
    changeset =
      %Posts{}
      |> Core.change_posts(params)
      |> Map.put(:action, :application)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"posts" => params}, %{assigns: %{current_user: user}} = socket) do
    case Core.create_posts(params, user) do
      {:ok, _post} ->
        {:noreply, assign(socket, posts: Core.list_posts())}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
