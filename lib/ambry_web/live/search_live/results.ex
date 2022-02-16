defmodule AmbryWeb.SearchLive.Results do
  @moduledoc """
  LiveView for showing search results.
  """

  use AmbryWeb, :p_live_view

  import AmbryWeb.SearchLive.Results.Components

  alias Ambry.Search

  on_mount {AmbryWeb.UserLiveAuth, :ensure_mounted_current_user}

  @impl Phoenix.LiveView
  def mount(%{"query" => query}, _session, socket) do
    query = String.trim(query)
    results = Search.search(query)

    {:ok,
     socket
     |> assign(:page_title, query)
     |> assign(:query, query)
     |> assign(:results, results)}
  end
end
