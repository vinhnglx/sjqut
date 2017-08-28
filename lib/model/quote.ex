defmodule Sjqut.Quote do
  use Sjqut.Web, :model

  schema "quotes" do
    field :film_title, :string
    field :content, :string

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:film_title, :content])
    |> validate_required([:film_title, :content])
  end
end
