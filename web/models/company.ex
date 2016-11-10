defmodule Hub.Company do
  use Hub.Web, :model

  schema "companies" do
    field :name, :string
    field :namespace, :string
    belongs_to :user, Hub.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :namespace])
    |> validate_required([:name, :namespace])
  end
end
