defmodule LampFirmware.MqttSupervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    children = [
      {Tortoise.Connection,
      [
        client_id: DIoTYCiClient,
        user_name: Application.get_env(:lamp_firmware, :dioty)[:username],
        password: Application.get_env(:lamp_firmware, :dioty)[:password],
        handler: {LampFirmware.MqttHandler, []},
        server: {Tortoise.Transport.Tcp, host: 'mqtt.dioty.co', port: 1883},
        subscriptions: [{"/joelbyler@gmail.com/ci", 0}]
      ]}
      # {Tortoise.Connection,
      #  [
      #    client_id: WombatTaskForce,
      #    server: {Tortoise.Transport.Tcp, host: 'localhost', port: 1883},
      #    handler: {Tortoise.Handler.Logger, []}
      #  ]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
