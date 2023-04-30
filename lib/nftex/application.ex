defmodule Nftex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NftexWeb.Telemetry,
      # Start the Ecto repository
      Nftex.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Nftex.PubSub},
      # Start Finch
      {Finch, name: Nftex.Finch},
      # Start the Endpoint (http/https)
      NftexWeb.Endpoint
      # Start a worker by calling: Nftex.Worker.start_link(arg)
      # {Nftex.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nftex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NftexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
