defmodule KodeChanWeb.IndexLive do
  use KodeChanWeb, :live_view
  alias KodeChan.Accounts
  require Logger
  require Jason

  def mount(_params, %{"user_id" => user_id}, socket) do
    {:ok,
     assign(socket, %{
       current_user: Accounts.get_user_from_id(user_id),
     })}
  end
end
