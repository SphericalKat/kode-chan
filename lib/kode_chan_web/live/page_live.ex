defmodule KodeChanWeb.PageLive do
  use KodeChanWeb, :live_view
  def mount(_params, %{"user_id" => user_id}, socket) do
    {:ok, assign(socket, current_user: nil)}
  end
end
