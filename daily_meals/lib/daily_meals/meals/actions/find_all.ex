defmodule DailyMeals.Meals.FindAll do
  import Ecto.Query
  alias DailyMeals.{Error, Repo}
  alias DailyMeals.Meals

  def call() do
    query = from(Meals)

    # IO.inspect(Repo.all(query), label: "\n:::::AQUI:::::\n")
    case Repo.all(query) do
      nil -> {:error, Error.build_meal_not_found_error()}
      meal -> {:ok, meal}
    end
  end
end
