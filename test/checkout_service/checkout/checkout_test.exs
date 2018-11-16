defmodule CheckoutService.CheckoutTest do
  use CheckoutService.DataCase

  alias CheckoutService.Checkout

  describe "orders" do
    alias CheckoutService.Checkout.Order

    @valid_attrs %{status: "some status"}
    @update_attrs %{status: "some updated status"}
    @invalid_attrs %{status: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Checkout.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Checkout.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Checkout.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Checkout.create_order(@valid_attrs)
      assert order.status == "some status"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Checkout.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, order} = Checkout.update_order(order, @update_attrs)
      assert %Order{} = order
      assert order.status == "some updated status"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Checkout.update_order(order, @invalid_attrs)
      assert order == Checkout.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Checkout.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Checkout.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Checkout.change_order(order)
    end
  end
end
