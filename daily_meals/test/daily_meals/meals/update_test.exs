defmodule DailyMeals.Meals.UpdateTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.{Meals, User}

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

      params = build(:meals_params, %{"user_id" => user_id})

      {:ok, %Meals{id: id}} = DailyMeals.create_meal(params)

      response = DailyMeals.update_meal(%{"id" => id, "calories" => 25})

      assert {:ok,
              %DailyMeals.Meals{
                calories: 25,
                date: ~U[2022-03-22 13:14:22Z],
                description: "Banana",
                id: ^id,
                user_id: ^user_id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = 1
      response = DailyMeals.update_meal(%{"id" => id})

      assert {:error, %DailyMeals.Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
