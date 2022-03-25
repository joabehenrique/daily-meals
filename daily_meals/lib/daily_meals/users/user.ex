defmodule DailyMeals.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias DailyMeals.Meals

  @primary_key {:id, :id, autogenerate: true}

  @required_params [:name, :cpf, :email]

  @derive {Jason.Encoder, only: [:id, :name, :cpf, :email]}

  schema "users" do
    field(:name, :string)
    field(:cpf, :string)
    field(:email, :string)

    has_many(:meals, Meals)

    timestamps()
  end

  def changeset(params), do: generate_changeset(params)
  def changeset(struct, params), do: generate_changeset(struct, params)

  defp generate_changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
  end
end
