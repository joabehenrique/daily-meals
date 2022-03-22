defmodule DailyMeals.Meals.UpdateTest do
  use DailyMeals.DataCase

  alias DailyMeals.{Error, Meals}

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      params = %{
        calories: 20,
        date: "2022-03-22 13:14:22",
        description: "Banana"
      }

      {_ok, meal} = DailyMeals.create_meal(params)

      response = DailyMeals.update_meal(%{"id" => meal.id, "calories" => 25})

      assert {:ok,
              %Meals{
                calories: 25,
                date: ~U[2022-03-22 13:14:22Z],
                description: "Banana",
                id: _id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "34"
      response = DailyMeals.update_meal(%{"id" => id})

      assert {:error, %Error{result: "Meal not found", status: :not_found}} = response
    end
  end
end
