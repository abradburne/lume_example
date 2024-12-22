defmodule LumeExampleWeb.Navigation do
  @default_items [
    %{icon: "hero-home", label: "Dashboard", nav_item: :dashboard, path: "/"},
    %{separator: true},
    %{icon: "hero-cube", label: "Things", nav_item: :things, path: "/things"},
  ]

  def default_items do
    @default_items
  end
end
