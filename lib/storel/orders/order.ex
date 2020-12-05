defmodule Storel.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias Storel.{OrderProducts.OrderProduct, Customers.Customer}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "orders" do
    belongs_to :customer, Customer
    has_many :order_products, OrderProduct

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer_id])
    |> foreign_key_constraint(:customer_id)
    |> validate_required([:customer_id, :order_products])
    |> cast_assoc(:order_products, with: &OrderProduct.changeset/2)
  end
end
