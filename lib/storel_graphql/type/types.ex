defmodule StorelGraphql.Schema.Types do
  use Absinthe.Schema.Notation
  alias StorelGraphql.Schema.Types

  import_types(Types.CustomerType)
  import_types(Types.ProductType)
  import_types(Types.OrderType)
end
