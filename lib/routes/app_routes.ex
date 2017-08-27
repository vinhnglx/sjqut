defmodule Sjqut.AppRoutes do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "Hello world")
  end
end
