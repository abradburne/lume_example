defmodule LumeExampleWeb.Router do
  use LumeExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LumeExampleWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LumeExampleWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/things", ThingLive.Index, :index
    live "/things/new", ThingLive.Index, :new
    live "/things/:id/edit", ThingLive.Index, :edit

    live "/things/:id", ThingLive.Show, :show
    live "/things/:id/show/edit", ThingLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", LumeExampleWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:lume_example, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LumeExampleWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
