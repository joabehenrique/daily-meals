defmodule DailyMeals.Meals do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}

  @required_params [:description, :date, :calories]

  @derive {Jason.Encoder, only: [:description, :date, :calories]}

  schema "meals" do
    field(:description, :string)
    field(:date, :utc_datetime)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
