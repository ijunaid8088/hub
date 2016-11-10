defmodule Hub.User do
  use Hub.Web, :model

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :company_name, :string
    field :company_url, :string
    field :company_role, :string
    field :token, :string
    field :password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstname, :lastname, :email, :company_name, :company_url, :company_role, :token, :password])
    |> validate_required([:firstname, :lastname, :email, :company_name, :company_url, :company_role, :token, :password])
  end
end
