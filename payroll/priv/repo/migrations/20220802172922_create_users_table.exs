defmodule Payroll.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table("users", primary_key: false) do
      add(:id, :binary_id, primary_key: true)
      add(:name, :string, null: false)
      add(:email, :string, null: false)
      add(:register, :integer, null: false)
      add(:department, :string, null: false)
      add(:role, :string, null: false)
      add(:leader, :string, null: false)

      timestamps(type: :utc_datetime)
    end
  end
end
