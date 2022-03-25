defmodule DailyMeals.UsersControllerTest do
  use DailyMealsWeb.ConnCase, async: true

  import DailyMeals.Factory

  alias DailyMeals.User

  describe "create/2" do
    test "when all params are valid, creates a user", %{conn: conn} do
      params = build(:users_params)

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:created)

      %{"user" => %{"id" => id}} = response

      assert %{
               "user" => %{
                 "name" => "Jp",
                 "email" => "jp@banana.com",
                 "cpf" => "12345678900",
                 "id" => ^id
               },
               "message" => "User created"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{description: "Banana"}

      expected_response = %{
        "message" => %{
          "cpf" => ["can't be blank"],
          "name" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when id exist, delete the user", %{conn: conn} do
      params = build(:users_params)

      {:ok, %User{id: id}} = DailyMeals.create_user(params)

      response =
        conn
        |> delete(Routes.user_path(conn, :delete, id))
        |> response(:no_content)

      assert "" = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = 1

      response =
        conn
        |> delete(Routes.user_path(conn, :delete, id))
        |> json_response(:not_found)

      assert %{
               "message" => "User not found"
             } = response
    end
  end

  describe "update/2" do
    test "when id exist, update the user", %{conn: conn} do
      params = build(:users_params)

      {:ok, %User{id: id}} = DailyMeals.create_user(params)

      updated_params = %{
        name: "Jp Alves"
      }

      response =
        conn
        |> put(Routes.user_path(conn, :update, id, updated_params))
        |> json_response(:ok)

      %{"user" => %{"id" => id}} = response

      assert %{
               "user" => %{
                 "cpf" => "12345678900",
                 "email" => "jp@banana.com",
                 "name" => "Jp Alves",
                 "id" => ^id
               }
             } = response
    end

    test "when not exist id, return an error", %{conn: conn} do
      id = 1

      response =
        conn
        |> put(Routes.user_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "User not found"} = response
    end
  end

  describe "get/2" do
    test "when id exist, return the meal", %{conn: conn} do
      params = build(:users_params)

      {:ok, %User{id: id}} = DailyMeals.create_user(params)

      response =
        conn
        |> get(Routes.user_path(conn, :find_by_id, id))
        |> json_response(:ok)

      %{"user" => %{"id" => id}} = response

      assert %{
               "user" => %{
                 "cpf" => "12345678900",
                 "email" => "jp@banana.com",
                 "id" => ^id,
                 "name" => "Jp"
               }
             } = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = 1

      response =
        conn
        |> get(Routes.user_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "User not found"} = response
    end
  end
end
