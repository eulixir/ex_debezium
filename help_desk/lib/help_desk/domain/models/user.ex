defmodule HelpDesk.Domain.Models.User do
  @moduledoc """
  Schema for a User
  """

  use HelpDesk.Schema
  import Ecto.Changeset

  @required ~w(name email register department role leader)a
  @optional ~w()

  @derive {Jason.Encoder, only: @required ++ @optional ++ [:id]}
  schema "users" do
    field(:name, :string)
    field(:email, :string)
    field(:register, :integer)
    field(:department, :string)
    field(:role, :string)
    field(:leader, :string)

    timestamps(type: :utc_datetime)
  end

  def changeset(schema \\ %__MODULE__{}, params) do
    schema
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
  end
end
