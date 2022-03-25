defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.{Meals, User}

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

      params = build(:meals_params, %{"user_id" => user_id})

      {:ok, %Meals{id: id} = response} = DailyMeals.create_meal(params)

      assert %DailyMeals.Meals{
               calories: 20,
               date: ~U[2022-03-22 13:14:22Z],
               description: "Banana",
               id: ^id,
               user_id: ^user_id
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        "calories" => 20,
        "date" => ~U[2016-02-29 22:25:00Z],
        "user_id" => 1
      }

      response = DailyMeals.create_meal(params)

      assert {:error, %DailyMeals.Error{}} = response
    end
  end
end
