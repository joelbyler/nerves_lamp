defmodule LampWebUi.FakeLamp do
  require Logger

  def set_color(color \\ "#aaaaaa") do
    Logger.info("Switching color to #{color}")
  end
end
