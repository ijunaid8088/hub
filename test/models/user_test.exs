defmodule Hub.UserTest do
  use Hub.ModelCase

  alias Hub.User

  @valid_attrs %{company_name: "some content", company_role: "some content", company_url: "some content", email: "some content", firstname: "some content", lastname: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
