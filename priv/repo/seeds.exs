# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Storel.Repo.insert!(%Storel.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Storel.Customers.create_customer(%{
  email: "elioenaiferrari2@gmail.com",
  password: "123123",
  password_confirmation: "123123",
  first_name: "Elioenai",
  last_name: "Ferrari",
  role: "admin"
})

playstation = %{name: "Playstation 5", price: 4600.0, quantity: 1}
xbox = %{name: "Xbox Series X", price: 4000.0, quantity: 1}

playstation |> Storel.Products.create_product()
xbox |> Storel.Products.create_product()
