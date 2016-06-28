defmodule FoodCourier.DishTest do
  use FoodCourier.ModelCase

  alias FoodCourier.Dish

  @valid_attrs %{name: "some content", price: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dish.changeset(%Dish{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dish.changeset(%Dish{}, @invalid_attrs)
    refute changeset.valid?
  end
end
