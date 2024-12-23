defmodule LumeExampleWeb.ThingLive.Index do
  use LumeExampleWeb, :live_view

  alias LumeExample.Things
  alias LumeExample.Things.Thing

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:current_nav_item, :things)
      |> assign(:nav_title, "Things")

    {:ok, stream(socket, :things, Things.list_things())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Thing")
    |> assign(:thing, Things.get_thing!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Thing")
    |> assign(:thing, %Thing{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Things")
    |> assign(:thing, nil)
  end

  @impl true
  def handle_info({LumeExampleWeb.ThingLive.FormComponent, {:saved, thing}}, socket) do
    {:noreply, stream_insert(socket, :things, thing)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    thing = Things.get_thing!(id)
    {:ok, _} = Things.delete_thing(thing)

    {:noreply, stream_delete(socket, :things, thing)}
  end
end
