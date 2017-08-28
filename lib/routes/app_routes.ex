defmodule Sjqut.AppRoutes do
  use Plug.Router

  # https://stackoverflow.com/questions/32543265/how-to-configure-the-plug-static-without-phoenix/32544252#32544252
  plug Plug.Static, at: "/", from: "lib/static", gzip: false, only: ~w(favicon.ico)

  plug :match

  # https://hexdocs.pm/plug/Plug.Parsers.html#module-built-in-parsers
  plug Plug.Parsers, parsers: [:urlencoded, :multipart]

  plug :dispatch

  get "/about" do
    send_resp(conn, 200, "A side-project made by Vincent Nguyen - vinhnglx")
  end

  get "/" do
    Sjqut.QuoteController.index(conn)
  end

  get "/quote/new" do
    Sjqut.QuoteController.new(conn)
  end

  post "/quote" do
    Sjqut.QuoteController.create(conn)
  end

  match _ do
    send_resp(conn, 200, "A side-project made by Vincent Nguyen - vinhnglx")
  end
end
