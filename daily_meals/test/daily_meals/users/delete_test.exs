defmodule DailyMeals.User.DeleteTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias DailyMeals.User

  describe "Delete user" do
    test "when a valid id is given, returns the user" do
      params = build(:users_params)

      {:ok, %User{id: id}} = DailyMeals.create_user(params)

      response = DailyMeals.delete_user(id)

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
      response = DailyMeals.delete_user(id)

      assert {:error, %DailyMeals.Error{result: "User not found", status: :not_found}} = response
    end
  end
end
