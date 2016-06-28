ExUnit.start

Mix.Task.run "ecto.create", ~w(-r FoodCourier.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r FoodCourier.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(FoodCourier.Repo)

