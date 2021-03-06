defmodule CommunityWeb.TopicsLive do
  alias CommunityWeb.{LiveView, PageView, IndexLive}

  use LiveView, container: {:div, class: "cm-page"}

  @topics [
    [id: 0, name: "全部", to: "news"],
    [id: 10004, name: "讨论", to: "discussions"],
    [id: 10002, name: "聊天/灌水", to: "chat"],
    [id: 10003, name: "问题/帮助", to: "questions-help"]
  ]

  def render(assigns) do
    Phoenix.View.render(PageView, "topics.html", assigns)
  end

  def mount(_session, socket) do
    {:ok,
     assign(socket,
       topics: @topics,
       nodes: IndexLive.nodes()
     )}
  end

  def handle_params(params, _uri, socket) do
    category_id = params |> Map.get("category_id", "0") |> to_i
    node_id = params |> Map.get("node_id", "0") |> to_i

    {:noreply,
     socket
     |> assign(
       category_id: category_id,
       node_id: node_id
     )}
  end
end
