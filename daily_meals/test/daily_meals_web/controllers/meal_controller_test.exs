defmodule DailyMeals.MealsControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.{Meals, User}

  describe "create/2" do
    test "when all params are valid, creates a meal", %{conn: conn} do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

      params = build(:meals_params, %{user_id: user_id})

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      %{"meal" => %{"id" => id}} = response

      assert %{
               "meal" => %{
                 "calories" => 20,
                 "date" => "2022-03-22T13:14:22Z",
                 "description" => "Banana",
                 "id" => ^id,
                 "user_id" => ^user_id
               },
               "message" => "Meal created"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

      params = build(:meals_invalid_params, %{"user_id" => user_id})

      expected_response = %{
        "message" => %{
          "calories" => ["can't be blank"],
          "date" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when id exist, delete the meal", %{conn: conn} do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

      params = build(:meals_params, %{"user_id" => user_id})

      {:ok, %Meals{id: id}} = DailyMeals.create_meal(params)

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert "" = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = 1

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:not_found)

      assert %{
               "message" => "Meal not found"
             } = response
    end
  end

  describe "update/2" do
    test "when id exist, update the meal", %{conn: conn} do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

      params = build(:meals_params, %{"user_id" => user_id})

      {:ok, %Meals{id: id}} = DailyMeals.create_meal(params)

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 20,
                 "date" => "2022-03-22T13:14:22Z",
                 "description" => "Banana",
                 "id" => ^id,
                 "user_id" => ^user_id
               }
             } = response
    end

    test "when not exist id, return an error", %{conn: conn} do
      id = 1

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = response
    end
  end

  describe "get/2" do
    test "when id exist, return the meal", %{conn: conn} do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = DailyMeals.create_user(user_params)

      params = build(:meals_params, %{"user_id" => user_id})

      {:ok, %Meals{id: id}} = DailyMeals.create_meal(params)

      response =
        conn
        |> get(Routes.meals_path(conn, :find_by_id, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calories" => 20,
                 "date" => "2022-03-22T13:14:22Z",
                 "description" => "Banana",
                 "id" => ^id,
                 "user_id" => ^user_id
               }
             } = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = 1

      response =
        conn
        |> get(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = response
    end
  end
end
