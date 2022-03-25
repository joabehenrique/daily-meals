defmodule DailyMeals.Repo.Migrations.TbUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :string)
      add(:cpf, :string)
      add(:email, :string)

      timestamps()
    end
  end
end
