defmodule Invoice do
  @moduledoc """
    This Module execute functions from Invoices
  """

  @doc """
    Receive a `invoice` and return a array list
      ## Example:
        iex> Invoice.make_invoice(["Agua", "Telefone", "Luz"])
          result => ["Agua", "Telefone", "Luz"]
  """
  def make_invoice(invoices) do
    invoices
  end

  def ordened_invoice(invoices) do
    Enum.sort(invoices)
  end

  def pass do

  end
end
