defmodule DailyMeals.Repo.Migrations.TbMeals do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add(:description, :string)
      add(:date, :utc_datetime)
      add(:calories, :integer)
      add(:user_id, references(:users))

      timestamps()
    end
  end
end
