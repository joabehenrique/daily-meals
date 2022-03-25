defmodule DailyMeals.User.CreateTest do
  use DailyMeals.DataCase, async: true

  import DailyMeals.Factory

  describe "Create User" do
    test "when all params are valid, returns the user" do
      user_params = build(:users_params)

      {:ok, response} = DailyMeals.create_user(user_params)

      id = response.id

      assert %DailyMeals.User{
               cpf: "12345678900",
               email: "jp@banana.com",
               name: "Jp",
               id: ^id
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        cpf: 12_345_678_900,
        email: "Jpbanana.com"
      }

      response = DailyMeals.create_user(params)

      assert {:error, %DailyMeals.Error{}} = response
    end
  end
end
