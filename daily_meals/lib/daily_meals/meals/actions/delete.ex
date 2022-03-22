defmodule DailyMeals.Meals.Delete do
  alias DailyMeals.{Error, Repo}
  alias DailyMeals.Meals

  def call(id) do
    case Repo.get(Meals, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> Repo.delete(meal)
    end
  end
end
