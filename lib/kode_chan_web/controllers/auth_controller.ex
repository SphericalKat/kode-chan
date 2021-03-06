defmodule KodeChanWeb.AuthController do
  use KodeChanWeb, :controller
  plug(Ueberauth)
  alias Ueberauth.Strategy.Helpers
  alias KodeChan.Accounts
  alias KodeChanWeb.Auth

  def delete(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    with {:ok, user} <- UserFromAuth.find_or_create(auth),
         {:ok, user} <-
           Accounts.get_or_create_user(user) do
      conn
      |> Auth.put_current_user(user)
      |> redirect(to: "/")
    else
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end
end
