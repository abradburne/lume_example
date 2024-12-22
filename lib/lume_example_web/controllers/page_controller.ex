defmodule LumeExampleWeb.PageController do
  use LumeExampleWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: ~p"/things")
  end
end
