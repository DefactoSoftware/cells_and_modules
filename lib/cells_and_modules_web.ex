defmodule CellsAndModulesWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use CellsAndModulesWeb, :controller
      use CellsAndModulesWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: CellsAndModulesWeb

      import Plug.Conn
      import CellsAndModulesWeb.Gettext
      alias CellsAndModulesWeb.Router.Helpers, as: Routes

      def render_view(%Plug.Conn{} = conn, view, assigns \\ []) do
        conn
        |> put_view(view)
        |> render("template.html", assigns)
      end
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: Path.dirname(__ENV__.file),
        path: ""

      use ExCell.Cell,
        namespace: CellsAndModulesWeb,
        adapter: ExCell.Adapters.CellJS

      use ExCSSModules.View,
        namespace: CellsAndModulesWeb,
        # embed_stylesheet: Mix.env() == :prod,
        stylesheet:
          __ENV__.file
          |> Path.dirname()
          |> Path.join("./style.css")

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import CellsAndModulesWeb.ErrorHelpers
      import CellsAndModulesWeb.Gettext
      alias CellsAndModulesWeb.Router.Helpers, as: Routes

      def class_name do
        name() |> class_name()
      end
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import CellsAndModulesWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
