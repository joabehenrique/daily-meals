defmodule DailyMealsWeb.UserController do
  use DailyMealsWeb, :controller

  alias DailyMeals.User
  alias DailyMealsWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %User{} = user} <- DailyMeals.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- DailyMeals.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _meal} <- DailyMeals.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def find_all(conn, _params) do
    with {:ok, user} <- DailyMeals.find_all_user() do
      conn
      |> put_status(:ok)
      |> render("find_all.json", user: user)
    end
  end

  def find_by_id(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- DailyMeals.find_by_id_user(id) do
      conn
      |> put_status(:ok)
      |> render("find_by_id.json", user: user)
    end
  end
end
