defmodule Hub.Router do
  use Hub.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hub do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Hub do
    pipe_through :api

    get "/users", UserController, :index
    post "/users/:username", UserController, :show
    post "/users", UserController, :create

    get "/companies", CompanyController, :index
    post "/companies", CompanyController, :create
  end
end
