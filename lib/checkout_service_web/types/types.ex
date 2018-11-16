defmodule CheckoutServiceWeb.Types do
  use Absinthe.Schema.Notation

  enum :status do
    value :cancelled
    value :complete
    value :new
  end

  object :order do
    field :id, :id
    field :status, :status
  end

  input_object :create_order_input do
    field :stripe_card_token, :string
  end
end
