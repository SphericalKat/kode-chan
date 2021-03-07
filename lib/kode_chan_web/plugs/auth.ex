defmodule KodeChanWeb.Auth do
  import Plug.Conn
  alias KodeChan.Accounts

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)

    user =
      cond do
        assigned = conn.assigns[:current_user] -> assigned
        true -> Accounts.get_user_from_id(user_id)
      end

    put_current_user(conn, user)
  end

  def put_current_user(conn, user) do
    token = user && KodeChanWeb.Token.sign(%{id: user.id})

    conn
    |> assign(:current_user, user)
    |> assign(:user_token, token)
    |> put_session(:user_id, user && user.id)
    |> configure_session(renew: true)
    |> put_req_header("authorization", "Bearer #{token}")
  end

  def drop_current_user(conn) do
    conn
    |> delete_req_header("authorization")
    |> configure_session(drop: true)
  end
end
