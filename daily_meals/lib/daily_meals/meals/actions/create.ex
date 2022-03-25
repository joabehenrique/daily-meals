defmodule DailyMeals.Meals.Create do
  alias DailyMeals.{Error, Repo}
  alias DailyMeals.Meals
  alias DailyMeals.User

  def call(%{"user_id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      _user -> create(params)
    end
  end

  defp create(params) do
    params
    |> Meals.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meals{}} = result), do: result

  defp handle_insert({:error, result}),
    do: {:error, Error.build(:bad_request, result)}
end
