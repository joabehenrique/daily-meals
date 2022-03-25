defmodule DailyMealsWeb.MealsController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Meals
  alias DailyMealsWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Meals{} = meal} <- DailyMeals.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, %Meals{} = meal} <- DailyMeals.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", meal: meal)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _meal} <- DailyMeals.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def find_all(conn, _params) do
    with {:ok, meal} <- DailyMeals.find_all_meal() do
      conn
      |> put_status(:ok)
      |> render("find_all.json", meal: meal)
    end
  end

  def find_by_id(conn, %{"id" => id}) do
    with {:ok, %Meals{} = meal} <- DailyMeals.find_by_id_meal(id) do
      conn
      |> put_status(:ok)
      |> render("find_by_id.json", meal: meal)
    end
  end
end
