defmodule DailyMealsWeb.MealsController do
  use DailyMealsWeb, :controller

  alias DailyMeals.Meals
  alias DailyMealsWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Meals{} = meal} <- DailyMeals.create_meal(params) do
      IO.inspect(meal, label: "::::::::::AQUI:::::::")

      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end
end
