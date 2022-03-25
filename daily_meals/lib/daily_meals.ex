defmodule DailyMeals do
  alias DailyMeals.Meals.Create, as: MealCreate
  alias DailyMeals.Meals.Update, as: MealUpdate
  alias DailyMeals.Meals.Delete, as: MealDelete
  alias DailyMeals.Meals.FindAll, as: MealFindAll
  alias DailyMeals.Meals.FindById, as: MealFindById

  alias DailyMeals.User.Create, as: UserCreate
  alias DailyMeals.User.Update, as: UserUpdate
  alias DailyMeals.User.Delete, as: UserDelete
  alias DailyMeals.User.FindAll, as: UserFindAll
  alias DailyMeals.User.FindById, as: UserFindById

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
  defdelegate delete_meal(params), to: MealDelete, as: :call
  defdelegate find_all_meal(), to: MealFindAll, as: :call
  defdelegate find_by_id_meal(params), to: MealFindById, as: :call

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate update_user(params), to: UserUpdate, as: :call
  defdelegate delete_user(params), to: UserDelete, as: :call
  defdelegate find_all_user(), to: UserFindAll, as: :call
  defdelegate find_by_id_user(params), to: UserFindById, as: :call
end
