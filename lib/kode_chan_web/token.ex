defmodule KodeChanWeb.Token do
  @namespace "user salt"

  def sign(data) do
    Phoenix.Token.sign(KodeChanWeb.Endpoint, @namespace, data)
  end

  def verify(token) do
    Phoenix.Token.verify(
      KodeChanWeb.Endpoint,
      @namespace,
      token,
      max_age: 365 * 24 * 3600
    )
  end
end
