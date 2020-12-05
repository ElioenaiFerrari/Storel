defmodule StorelGraphql.Schema.Types do
  use Absinthe.Schema.Notation
  alias StorelGraphql.Schema.Types

  import_types(Types.CustomerType)
end
