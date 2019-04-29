defmodule InvoiceTest do
  use ExUnit.Case
  doctest Invoice

  test "must be make invoices list" do
    invoices = Invoice.make_invoice(["Agua", "Luz", "Telefone"])
    
    assert invoices == ["Agua", "Luz", "Telefone"]
  end

  test "must be return list invoices ordened" do
    invoices = Invoice.make_invoice(["Agua", "Telefone", "Luz"])

    refute Invoice.ordened_invoice(invoices) == ["Agua", "Telefone", "Luz"]
  end

end
