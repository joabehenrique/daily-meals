defmodule DailyMeals do
  alias DailyMeals.Meals.Create, as: MealCreate
  alias DailyMeals.Meals.Update, as: MealUpdate
  alias DailyMeals.Meals.Delete, as: MealDelete
  alias DailyMeals.Meals.FindAll, as: MealFindAll
  alias DailyMeals.Meals.FindById, as: MealFindById

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
  defdelegate delete_meal(params), to: MealDelete, as: :call
  defdelegate find_all_meal(), to: MealFindAll, as: :call
  defdelegate find_by_id_meal(params), to: MealFindById, as: :call
end
