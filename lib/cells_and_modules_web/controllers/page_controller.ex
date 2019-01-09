defmodule CellsAndModulesWeb.PageController do
  use CellsAndModulesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
