defmodule Hub.UserController do
  use Hub.Web, :controller

  import Hub.UserValidators

  alias Hub.User
  alias Hub.ErrorView

  def show(conn, %{"username" => username} = params) do
    with :ok <- validate_token(params["token"]),
         :ok <- validate_password(username, params["password"]) do
      user = User.by_username(username)
      render(conn, "show.json", user: user)
    else
      {:invalid, message} ->
        conn
        |> put_status(401)
        |> render(ErrorView, "error.json", %{message: message})
    end
  end

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", users: users)
  end

  def create(conn, user_params) do
    token = Enum.concat(?a..?z, ?0..?9) |> Enum.take_random(4)
    user_params = user_params |> Map.merge(%{"token" => "hub#{token}hub"})

    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Hub.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
