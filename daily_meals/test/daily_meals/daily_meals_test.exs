defmodule DailyMeals.MealsTest do
  use DailyMeals.DataCase

  alias Ecto.Changeset

  alias DailyMeals.Meals

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{description: "Batata", date: "2022-03-22 13:14:22", calories: "20"}

      response = Meals.changeset(params)

      assert %Changeset{
               changes: %{description: "Batata", date: ~U[2022-03-22 13:14:22Z], calories: 20},
               valid?: true
             } = response
    end
  end
end
