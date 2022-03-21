defmodule DailyMealsWeb.MealsView do
  use DailyMealsWeb, :view

  alias DailyMeals.Meals

  def render("create.json", %{meal: %Meals{} = meal}),
    do: %{
      message: "Meal created",
      meal: meal
    }
end
