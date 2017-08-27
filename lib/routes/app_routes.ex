defmodule Sjqut.AppRoutes do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/about" do
    send_resp(conn, 200, "A side-project made by Vincent Nguyen - vinhnglx")
  end
end
