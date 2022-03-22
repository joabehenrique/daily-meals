defmodule DailyMeals.Meals.DeleteTest do
  use DailyMeals.DataCase

  alias DailyMeals.{Error, Meals}

  describe "Delete Meal" do
    test "when a valid id is given, returns the meal" do
      params = %{
        calories: 20,
        date: "2022-03-22 13:14:22",
        description: "Banana"
      }

      {_ok, meal} = DailyMeals.create_meal(params)

      response = DailyMeals.delete_meal(meal.id)

      assert {:ok,
              %Meals{
                calories: 20,
                date: ~U[2022-03-22 13:14:22Z],
                description: "Banana",
                id: _id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "34"
      response = DailyMeals.delete_meal(id)

      assert {:error, %Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
