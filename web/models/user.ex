defmodule Hub.User do
  use Hub.Web, :model

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :username, :string
    field :email, :string
    field :company_name, :string
    field :company_url, :string
    field :company_role, :string
    field :token, :string
    field :password, :string

    timestamps()
  end

  defp encrypt_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password, hash_password(password))
      _ ->
        changeset
    end
  end

  def hash_password(password) do
    Comeonin.Bcrypt.hashpass(password, Comeonin.Bcrypt.gen_salt(12, true))
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstname, :lastname, :email, :company_name, :company_url, :company_role, :token, :password, :username])
    |> validate_required([:firstname, :lastname, :email, :company_name, :company_url, :company_role, :token, :password, :username])
    |> validate_length(:password, [min: 6, message: "Password should be at least 6 character(s)."])
    |> encrypt_password
    |> update_change(:username, &String.downcase/1)
    |> update_change(:email, &String.downcase/1)
    |> update_change(:firstname, &String.trim/1)
    |> update_change(:lastname, &String.trim/1)
    |> validate_length(:firstname, [min: 2, message: "Firstname should be at least 2 character(s)."])
    |> validate_length(:lastname, [min: 2, message: "Lastname should be at least 2 character(s)."])
  end
end
