defmodule DailyMeals.User.UpdateTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.User

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:users_params)

      {:ok, %User{id: id}} = DailyMeals.create_user(user_params)

      response = DailyMeals.update_user(%{"id" => id, "name" => "Jp Alves"})

      assert {:ok,
              %DailyMeals.User{
                cpf: "12345678900",
                email: "jp@banana.com",
                name: "Jp Alves",
                id: ^id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = 1
      response = DailyMeals.update_user(%{"id" => id})

      assert {:error, %DailyMeals.Error{result: "User not found", status: :not_found}} = response
    end
  end
end
