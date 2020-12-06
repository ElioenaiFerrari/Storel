defmodule StorelGraphql.Resolvers.ProductResolver do
  alias Storel.Products

  def list_products(_parent, _args, _resolution) do
    {:ok, Products.list_products()}
  end

  def create_product(_parent, %{product: product}, _resolution) do
    Products.create_product(product)
  end
end
