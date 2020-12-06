defmodule StorelGraphql.Schema.Types.ProductType do
  use Absinthe.Schema.Notation

  object :product_type do
    field :id, :string
    field :name, :string
    field :price, :string
    field :quantity, :integer
  end

  input_object :product_input_type do
    field :name, :string
    field :price, :string
    field :quantity, :integer
  end
end
