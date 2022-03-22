defmodule DailyMeals.Meals do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}

  @required_params [:description, :date, :calories]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories]}

  schema "meals" do
    field(:description, :string)
    field(:date, :utc_datetime)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(params), do: generate_changeset(params)
  def changeset(struct, params), do: generate_changeset(struct, params)

  defp generate_changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
