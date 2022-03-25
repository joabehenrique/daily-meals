defmodule DailyMeals.User.FindAll do
  import Ecto.Query
  alias DailyMeals.{Error, Repo}
  alias DailyMeals.User

  def call() do
    query = from(User)

    case Repo.all(query) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
