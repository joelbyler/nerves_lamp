defmodule LampWebUiWeb.ThermostatLive do
  use Phoenix.LiveView

  @lamp_control Application.get_env(:lamp_web_ui, :lamp_control)

  def render(assigns) do
    Phoenix.View.render(LampWebUiWeb.PageView, "temp_live_view.html", assigns)
  end

  def mount(_params, socket) do
    {:ok, assign(socket, :color, "#ffffff")}
  end

  def handle_event("validate", %{ "lamp" => %{"color" => color} }, socket) do
    lamp_control().set_color(color)
    {:noreply, assign(socket, color: color)}
  end

  def lamp_control do
    @lamp_control || LampControl.Lamp
  end
end
