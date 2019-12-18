defmodule LampWebUiWeb.ThermostatLive do
  use Phoenix.LiveView

  @lamp_control Application.get_env(:lamp_web_ui, :lamp_control)

  def render(assigns) do
    Phoenix.View.render(LampWebUiWeb.PageView, "lamp_live_view.html", assigns)
  end

  def mount(_params, socket) do
    {:ok, assign(socket, :color, "#ffffff")}
  end

  def handle_event("validate", %{ "lamp" => %{"color" => color} }, socket) do
    lamp_control().set_color(color)
    {:noreply, assign(socket, color: color)}
  end

  def handle_event("change-to-blue", _, socket) do
    set_color("#000dff", socket)
  end
  def handle_event("change-to-red", _, socket) do
    set_color("#ff000c", socket)
  end
  def handle_event("change-to-yellow", _, socket) do
    set_color("#fffa18", socket)
  end
  def handle_event("change-to-green", _, socket) do
    set_color("#19ff02", socket)
  end
  def handle_event("change-to-orange", _, socket) do
    set_color("#ffa304", socket)
  end
  def handle_event("change-to-magenta", _, socket) do
    set_color("#ff00fd", socket)
  end

  def lamp_control do
    @lamp_control || LampControl.Lamp
  end

  defp set_color(color, socket) do
    lamp_control().set_color(color)
    {:noreply, assign(socket, color: color)}
  end
end
