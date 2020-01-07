defmodule LampFirmware.MqttHandler do
  use Tortoise.Handler
  require Logger

  def init(args) do
    {:ok, args}
  end

  def connection(status, state) do
    {:ok, state}
  end

  # Below subscribe to /joelbyler@gmail.com/ci topic on mqtt.dioty.co:1883

  def handle_message(["", "joelbyler@gmail.com", "ci"], "working", state) do
    Logger.info("MqttHandler fail message")

    LampControl.Lamp.set_color("#0000ff")
    {:ok, state}
  end

  def handle_message(["", "joelbyler@gmail.com", "ci"], "success", state) do
    Logger.info("MqttHandler success message")

    LampControl.Lamp.set_color("#ff0000")
    {:ok, state}
  end

  def handle_message(["", "joelbyler@gmail.com", "ci"], "fail", state) do
    Logger.info("MqttHandler fail message")

    LampControl.Lamp.set_color("#00ff00")
    {:ok, state}
  end


  def handle_message(topic, payload, state) do
    Logger.info("MqttHandler unhandled message #{topic}:#{payload}")
    {:ok, state}
  end

  def subscription(status, topic_filter, state) do
    Logger.info("MqttHandler subscription #{status}")
    {:ok, state}
  end

  def terminate(reason, state) do
    Logger.info("MqttHandler terminate #{reason}")
    :ok
  end
end
