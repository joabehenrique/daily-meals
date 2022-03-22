defmodule DailyMeals.Meals.FindById do
  alias DailyMeals.{Error, Repo}
  alias DailyMeals.Meals

  def call(id) do
    case Repo.get(Meals, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end
end
