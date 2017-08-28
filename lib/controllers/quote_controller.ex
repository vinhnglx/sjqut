defmodule Sjqut.QuoteController do
  import Plug.Conn
  use Sjqut.Web, :controller

  alias Sjqut.Quote

  def index(conn) do
    page_contents = EEx.eval_file("lib/templates/quote/index.eex")
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, page_contents)
  end

  def new(conn) do
    changeset = Quote.changeset(%Quote{})
    page_contents = EEx.eval_file("lib/templates/quote/new.eex", [changeset: changeset])
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, page_contents)
  end

  def create(conn) do
    changeset = Quote.changeset(%Quote{}, conn.body_params["quote"])
    case Repo.insert(changeset) do
      {:ok, _quote} ->
        page_contents = EEx.eval_file("lib/templates/quote/index.eex")
        conn
        |> put_resp_content_type("text/html")
        |> send_resp(200, page_contents)

      {:error, changeset} ->
        page_contents = EEx.eval_file("lib/templates/quote/new.eex", [changeset: changeset])
        conn
        |> put_resp_content_type("text/html")
        |> send_resp(200, page_contents)
    end
  end
end
