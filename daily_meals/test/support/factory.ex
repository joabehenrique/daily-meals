defmodule DailyMeals.Factory do
  use ExMachina.Ecto, repo: DailyMeals.Repo

  alias DailyMeals.{Meals, User}

  def meals_params_factory do
    %{
      "description" => "Banana",
      "date" => "2022-03-22 13:14:22",
      "calories" => "20",
      "user_id" => 1
    }
  end

  def meals_invalid_params_factory do
    %{
      "description" => "Banana"
    }
  end

  def meal_factory do
    %Meals{
      description: "banana",
      date: "2022-03-22 13:14:22",
      calories: "2",
      user_id: 1,
      id: 1
    }
  end

  def users_params_factory do
    %{
      name: "Jp",
      email: "jp@banana.com",
      cpf: "12345678900"
    }
  end

  def user_factory do
    %User{
      name: "Jp",
      email: "jp@banana.com",
      cpf: "12345678900",
      id: 1
    }
  end
end
