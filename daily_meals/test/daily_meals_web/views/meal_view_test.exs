defmodule DailyMealsWeb.MealsViewTest do
  use DailyMealsWeb.ConnCase, async: true

  import Phoenix.View

  import DailyMeals.Factory

  alias DailyMeals.{Meals, User}

  alias DailyMealsWeb.MealsView

  test "render create.json" do
    user_params = build(:users_params)

    {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

    params = build(:meals_params, %{"user_id" => user_id})
    {:ok, %Meals{id: id} = meal} = DailyMeals.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meals{
               calories: 20,
               date: ~U[2022-03-22 13:14:22Z],
               description: "Banana",
               id: ^id,
               user_id: ^user_id
             },
             message: "Meal created"
           } = response
  end

  test "render meal.json" do
    user_params = build(:users_params)

    {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

    params = build(:meals_params, %{"user_id" => user_id})
    {:ok, %Meals{id: id} = meal} = DailyMeals.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meals{
               calories: 20,
               date: ~U[2022-03-22 13:14:22Z],
               description: "Banana",
               id: ^id,
               user_id: ^user_id
             }
           } = response
  end
end
