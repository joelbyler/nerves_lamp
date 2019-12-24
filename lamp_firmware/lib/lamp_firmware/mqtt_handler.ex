defmodule LampFirmware.MqttHandler do
  use Tortoise.Handler
  require Logger

  def init(args) do
    {:ok, args}
  end


  def connection(status, state) do
    # `status` will be either `:up` or `:down`; you can use this to
    # inform the rest of your system if the connection is currently
    # open or closed; tortoise should be busy reconnecting if you get
    # a `:down`
    Logger.info("MqttHandler connection state")

    {:ok, state}
  end

  def handle_message(["", "joelbyler@gmail.com", "ci"], "success", state) do
    Logger.info("MqttHandler success message")

    LampControl.Lamp.set_color("#00ff00")
    {:ok, state}
  end

  def handle_message(["", "joelbyler@gmail.com", "ci"], "fail", state) do
    Logger.info("MqttHandler fail message")

    LampControl.Lamp.set_color("#ff0000")
    {:ok, state}
  end

  def handle_message(["", "joelbyler@gmail.com", "ci"], "working", state) do
    Logger.info("MqttHandler fail message")

    LampControl.Lamp.set_color("#0000ff")
    {:ok, state}
  end

  def handle_message(topic, payload, state) do
    # unhandled message! You will crash if you subscribe to something
    # and you don't have a 'catch all' matcher; crashing on unexpected
    # messages could be a strategy though.
    Logger.info("MqttHandler unhandled message #{topic}:#{payload}")

    {:ok, state}
  end

  def subscription(status, topic_filter, state) do
    Logger.info("MqttHandler subscription #{status}")

    {:ok, state}
  end

  def terminate(reason, state) do
    Logger.info("MqttHandler terminate #{reason}")
    # tortoise doesn't care about what you return from terminate/2,
    # that is in alignment with other behaviours that implement a
    # terminate-callback
    :ok
  end
end
