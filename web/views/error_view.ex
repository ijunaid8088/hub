defmodule Hub.ErrorView do
  use Hub.Web, :view

  def render("error.json", %{message: message}) do
    %{
      message: message
    }
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
