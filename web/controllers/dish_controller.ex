defmodule FoodCourier.DishController do
  use FoodCourier.Web, :controller

  alias FoodCourier.Dish

  plug :scrub_params, "dish" when action in [:create, :update]

  def index(conn, _params) do
    dishes = Repo.all(Dish)
    render(conn, "index.html", dishes: dishes)
  end

  def new(conn, _params) do
    changeset = Dish.changeset(%Dish{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dish" => dish_params}) do
    changeset = Dish.changeset(%Dish{}, dish_params)

    case Repo.insert(changeset) do
      {:ok, _dish} ->
        conn
        |> put_flash(:info, "Dish created successfully.")
        |> redirect(to: dish_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dish = Repo.get!(Dish, id)
    render(conn, "show.html", dish: dish)
  end

  def edit(conn, %{"id" => id}) do
    dish = Repo.get!(Dish, id)
    changeset = Dish.changeset(dish)
    render(conn, "edit.html", dish: dish, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dish" => dish_params}) do
    dish = Repo.get!(Dish, id)
    changeset = Dish.changeset(dish, dish_params)

    case Repo.update(changeset) do
      {:ok, dish} ->
        conn
        |> put_flash(:info, "Dish updated successfully.")
        |> redirect(to: dish_path(conn, :show, dish))
      {:error, changeset} ->
        render(conn, "edit.html", dish: dish, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dish = Repo.get!(Dish, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(dish)

    conn
    |> put_flash(:info, "Dish deleted successfully.")
    |> redirect(to: dish_path(conn, :index))
  end
end
