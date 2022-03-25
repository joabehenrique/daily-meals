defmodule DailyMeals.MealTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias Ecto.Changeset

  alias DailyMeals.Meals

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      user_params = build(:users_params)

      DailyMeals.create_user(user_params)

      response =
        :meals_params
        |> build()
        |> Meals.changeset()

      assert %Changeset{
               changes: %{
                 description: "Banana",
                 date: ~U[2022-03-22 13:14:22Z],
                 calories: 20,
                 user_id: _user_id
               },
               valid?: true
             } = response
    end
  end
end
