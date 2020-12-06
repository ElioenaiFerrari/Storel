defmodule StorelGraphql.Resolvers.OrderResolver do
  alias Storel.Orders.Services.CreateOrder

  def list_orders(_parent, _args, _resolution) do
    {:ok, Orders.list_orders()}
  end

  def create_order(
        _parent,
        %{order: %{customer_id: customer_id, products: products}},
        _resolution
      ) do
    CreateOrder.execute(customer_id, products)
  end
end
