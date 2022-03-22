defmodule DailyMeals.Meals.Update do
  alias DailyMeals.{Error, Repo}
  alias DailyMeals.Meals

  def call(%{"id" => id} = params) do
    case Repo.get(Meals, id) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> update(meal, params)
    end
  end

  defp update(meal, params) do
    meal
    |> Meals.changeset(params)
    |> Repo.update()
  end
end
