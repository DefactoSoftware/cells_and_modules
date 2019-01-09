defmodule CellsAndModulesWeb.PageController do
  use CellsAndModulesWeb, :controller

  alias CellsAndModulesWeb.PageView

  def index(conn, _params) do
    render_view(conn, PageView)
  end
end
