defmodule CheckoutServiceWeb.Router do
  use CheckoutServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CheckoutServiceWeb do
    pipe_through :api
  end

  forward "/graphql",  Absinthe.Plug, schema: CheckoutServiceWeb.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: CheckoutServiceWeb.Schema
end
