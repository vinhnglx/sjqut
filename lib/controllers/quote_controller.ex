defmodule Sjqut.QuoteController do
  import Plug.Conn

  def index(conn) do
    page_contents = EEx.eval_file("lib/templates/quote/index.eex")
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, page_contents)
  end
end
