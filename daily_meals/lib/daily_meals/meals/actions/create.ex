defmodule DailyMeals.Meals.Create do
  alias DailyMeals.{Error, Repo}
  alias DailyMeals.Meals

  def call(params) do
    params
    |> Meals.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meals{}} = result), do: result

  defp handle_insert({:error, result}),
    do: {:error, Error.build(:bad_request, result)}
end
