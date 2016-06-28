defmodule FoodCourier.Repo.Migrations.CreateDish do
  use Ecto.Migration

  def change do
    create table(:dishes) do
      add :name, :string
      add :price, :integer

      timestamps
    end

  end
end
