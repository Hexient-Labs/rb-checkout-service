defmodule CheckoutServiceWeb.Schema do
  use Absinthe.Schema
  import CheckoutService.SimpleResolver

  import_types(CheckoutServiceWeb.Types)

  query do
    field :orders_for_current_customer, non_null(list_of(:order)) do
      resolve(&run/2)
    end
  end

end
