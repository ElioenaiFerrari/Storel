defmodule StorelGraphql.Schema do
  use Absinthe.Schema
  alias StorelGraphql.Schema
  alias StorelGraphql.Resolvers
  import AbsintheErrorPayload.Payload

  import_types(Schema.Types)
  import_types(AbsintheErrorPayload.ValidationMessageTypes)

  query do
    @desc "Get all customers"
    field :customers, list_of(:customer_type) do
      resolve(&Resolvers.CustomerResolver.list_customers/3)
    end

    @desc "Get all products"
    field :products, list_of(:product_type) do
      resolve(&Resolvers.ProductResolver.list_products/3)
    end
  end

  payload_object(:customer_payload, :customer_type)
  payload_object(:product_payload, :product_type)

  mutation do
    @desc "Create new customer"
    field :create_customer, :customer_payload do
      arg(:customer, non_null(:customer_input_type))
      resolve(&Resolvers.CustomerResolver.create_customer/3)
      middleware(&build_payload/2)
    end

    @desc "Create new product"
    field :create_product, :product_payload do
      arg(:product, non_null(:product_input_type))
      resolve(&Resolvers.ProductResolver.create_product/3)
      middleware(&build_payload/2)
    end
  end
end
