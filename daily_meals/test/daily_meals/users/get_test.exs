defmodule DailyMeals.User.GetTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.User

  describe "Get User" do
    test "when a valid id is given, returns the user" do
      user_params = build(:users_params)

      {:ok, %User{id: id}} = DailyMeals.create_user(user_params)

      response = DailyMeals.find_by_id_user(id)

      assert {:ok,
              %DailyMeals.User{
                cpf: "12345678900",
                email: "jp@banana.com",
                name: "Jp",
                id: ^id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = 1
      response = DailyMeals.find_by_id_user(id)

      assert {:error, %DailyMeals.Error{result: "User not found", status: :not_found}} = response
    end
  end
end
