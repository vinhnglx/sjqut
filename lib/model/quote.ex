defmodule Sjqut.Quote do
  use Sjqut.Web, :model

  schema "quotes" do
    field :film_title, :string
    field :content, :string

    timestamps()
  end
end
