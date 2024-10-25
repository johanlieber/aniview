defmodule AnimeviewWeb.SvelteLive do
  use AnimeviewWeb, :live_view

  def render(assigns) do
    ~H"""
    <.svelte name="Home" socket={@socket} />
    """
  end

  # def handle_event("set_number", %{"number" => number}, socket) do
  #   {:noreply, assign(socket, :number, number)}
  # end
  #
  def mount(_params, _session, socket) do
    # {:ok, assign(socket, :number, 5)}
    {:ok, socket}
  end
end
