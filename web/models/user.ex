defmodule Hub.User do
  use Hub.Web, :model

  schema "users" do
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :company_name, :string
    field :company_url, :string
    field :company_role, :string
    field :api_id, :string
    field :api_key, :string
    field :password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstname, :lastname, :email, :company_name, :company_url, :company_role, :api_key, :api_id, :password])
    |> validate_required([:firstname, :lastname, :email, :company_name, :company_url, :company_role, :api_key, :api_id, :password])
  end
end
