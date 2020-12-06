defmodule StorelGraphql.Schema.Types.OrderType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Storel.Repo

  object :order_type do
    field :id, :string
    field :customer_id, :string
    field :order_products, list_of(:order_products), resolve: assoc(:order_products)
  end

  object :order_products do
    field :id, :string
    field :price, :string
    field :quantity, :integer
    field :product, :product_type, resolve: assoc(:product)
  end

  input_object :order_input_type do
    field :customer_id, :string
    field :products, list_of(:product_info)
  end

  input_object :product_info do
    field :id, :string
    field :quantity, :integer
  end
end
