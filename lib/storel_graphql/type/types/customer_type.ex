defmodule StorelGraphql.Schema.Types.CustomerType do
  use Absinthe.Schema.Notation

  object :customer_type do
    field :id, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :role, :string
  end

  input_object :customer_input_type do
    field :email, :string
    field :password, :string
    field :password_confirmation, :string
    field :first_name, :string
    field :last_name, :string
    field :role, :string
  end
end
