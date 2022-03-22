defmodule DailyMealsWeb.MealsViewTest do
  use DailyMealsWeb.ConnCase, async: true

  import Phoenix.View

  alias DailyMeals.Meals
  alias DailyMealsWeb.MealsView

  test "render create.json" do
    params = %{description: "Banana", date: "2020-03-10 13:14:22", calories: "20"}
    {_ok, meal} = DailyMeals.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %DailyMeals.Meals{
               __meta__: _,
               calories: 20,
               date: ~U[2020-03-10 13:14:22Z],
               description: "Banana",
               id: _
             },
             message: "Meal created"
           } = response
  end

  test "render meal.json" do
    params = %{description: "Banana", date: "2020-03-10 13:14:22", calories: "20"}
    {_ok, meal} = DailyMeals.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %DailyMeals.Meals{
               __meta__: _,
               calories: 20,
               date: ~U[2020-03-10 13:14:22Z],
               description: "Banana",
               id: _
             },
             message: "Meal created"
           } = response
  end
end
