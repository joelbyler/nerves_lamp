defmodule LampWebUiWeb.PageController do
  use LampWebUiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
