defmodule DailyMeals.UserTest do
  use DailyMeals.DataCase

  import DailyMeals.Factory

  alias Ecto.Changeset

  alias DailyMeals.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:users_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 cpf: "12345678900",
                 name: "Jp",
                 email: "jp@banana.com"
               },
               valid?: true
             } = response
    end
  end
end
