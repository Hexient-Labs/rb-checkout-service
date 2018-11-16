defmodule CheckoutService.SimpleResolver do
  @statuses [:cancelled, :complete, :new]

  defp generate_id do
    Enum.random(0..10000)
  end

  defp generate_order_item(occurrences) do
    Enum.map(0..occurrences, fn _ -> generate_order() end)
  end

  defp generate_order do
    %{id: generate_id(), status: generate_status()}
  end

  defp generate_status do
    Enum.random(@statuses)
  end

  def run(%{}, _) do
    {:ok, generate_order_item(5)}
  end
end
