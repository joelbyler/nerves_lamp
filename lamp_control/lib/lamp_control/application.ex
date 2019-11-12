defmodule LampControl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      # Starts a worker by calling: LampControl.Worker.start_link(arg)
      # {LampControl.Worker, arg}
      worker(LampControl.Lamp, [[color: "#4B0082"]])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LampControl.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
