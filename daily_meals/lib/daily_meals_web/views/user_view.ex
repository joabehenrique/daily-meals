defmodule DailyMealsWeb.UserView do
  use DailyMealsWeb, :view

  alias DailyMeals.User

  def render("create.json", %{user: %User{} = user}),
    do: %{
      message: "User created",
      user: user
    }

  def render("user.json", %{user: %User{} = user}),
    do: %{
      user: user
    }

  def render("find_all.json", %{user: user}) do
    %{
      message: "User found",
      user: user
    }
  end

  def render("find_by_id.json", %{user: %User{} = user}) do
    %{
      message: "User found",
      user: user
    }
  end

  def render("update.json", %{user: %User{} = user}) do
    %{
      message: "User updated",
      user: user
    }
  end
end
