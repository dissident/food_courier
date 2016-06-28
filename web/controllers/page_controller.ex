defmodule FoodCourier.PageController do
  use FoodCourier.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
