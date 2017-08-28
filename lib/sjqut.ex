defmodule Sjqut do
  @moduledoc """
    Documenation for Sjqut
  """
  use Application
  require Logger

  @doc """
    Start a process to run AppRoutes
  """
  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, Sjqut.AppRoutes, []),
      supervisor(Sjqut.Repo, [])
    ]

    Logger.info "Started application"

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
