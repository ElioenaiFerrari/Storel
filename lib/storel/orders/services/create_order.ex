defmodule Storel.Orders.Services.CreateOrder do
  alias Storel.Customers
  alias Storel.Products
  alias Storel.Orders

  defp build_product_map(product) do
    %{
      product_id: product.id,
      price: product.price,
      quantity: product.quantity,
      name: product.name
    }
  end

  defp product_service(product) do
    Products.filter_by_id_quantity(product)
    |> case do
      nil ->
        nil

      product_exists ->
        build_product_map(product_exists)
    end
  end

  def execute(customer_id, products) do
    order =
      products
      |> Enum.map(&product_service/1)
      |> Enum.filter(&(&1 != nil))
      |> case do
        [] ->
          {:error, "no products here"}

        order_products ->
          %{
            customer_id: customer_id,
            order_products: order_products
          }
      end
      |> Orders.create_order()
      |> case do
        {:ok, order} ->
          order =
            order
            |> Storel.Repo.preload(order_products: [:product])

        {:error, reason} ->
          reason
      end
  end
end
