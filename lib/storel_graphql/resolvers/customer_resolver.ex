defmodule StorelGraphql.Resolvers.CustomerResolver do
  alias Storel.Customers

  def list_customers(_parent, _args, _resolution) do
    {:ok, Customers.list_customers()}
  end

  def create_customer(_parent, %{customer: customer}, _resolution) do
    Customers.create_customer(customer)
  end
end
