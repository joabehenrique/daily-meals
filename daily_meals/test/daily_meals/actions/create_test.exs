defmodule DailyMeals.Meals.CreateTest do
  use DailyMeals.DataCase

  alias DailyMeals.{Error, Meals}

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      params = %{
        calories: 20,
        date: "2022-03-22 13:14:22",
        description: "Banana"
      }

      response = DailyMeals.create_meal(params)

      assert {:ok,
              %Meals{
                calories: 20,
                date: ~U[2022-03-22 13:14:22Z],
                description: "Banana"
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 12,
        date: "2022-03-22"
      }

      response = DailyMeals.create_meal(params)

      assert {:error, %Error{}} = response
    end
  end
end
