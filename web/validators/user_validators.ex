defmodule Hub.UserValidators do
  alias Hub.User

  def validate_token(token) do
    with %Hub.User{} <- User.by_token(token) do
      :ok
    else
      nil ->
        {:invalid}
    end
  end

  def validate_password(username, password) do
    with %Hub.User{password: u_password} <- User.by_username(username) do
      case Comeonin.Bcrypt.checkpw(password, u_password) do
        true  -> :ok
        false -> {:invalid}
       end
    else
      nil ->
        {:invalid}
    end
  end
end