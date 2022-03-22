defmodule DailyMealsWeb.MealsView do
  use DailyMealsWeb, :view

  alias DailyMeals.Meals

  def render("create.json", %{meal: %Meals{} = meal}),
    do: %{
      message: "Meal created",
      meal: meal
    }

  def render("find_all.json", %{meal: meal}) do
    %{
      message: "Meal found",
      meal: meal
    }
  end

  def render("find_by_id.json", %{meal: %Meals{} = meal}) do
    %{
      message: "Meal found",
      meal: meal
    }
  end

  def render("update.json", %{meal: %Meals{} = meal}) do
    %{
      message: "Meal updated",
      meal: meal
    }
  end
end
