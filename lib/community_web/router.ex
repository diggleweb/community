defmodule CommunityWeb.Router do
  use CommunityWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CommunityWeb do
    pipe_through :browser

    live "/", IndexLive
    live "/topics", TopicsLive
    live "/t/:id", ArticleLive
    live "/cities/:id/users", CityLive
    live "/users/:id/:happened", UserLive
    live "/users/:id", UserLive
    live "/contribute", ContributeLive
    live "/about", AboutLive
    live "/login", LoginLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", CommunityWeb do
  #   pipe_through :api
  # end
end
