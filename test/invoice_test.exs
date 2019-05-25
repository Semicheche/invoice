defmodule InvoiceTest do
  use ExUnit.Case
  doctest Invoice

  test "must be make invoices list" do
    invoices = Invoice.make_invoice(["Agua", "Telefone", "Luz"], [5, 10, 11])
    
    assert invoices == [
      %Invoice.Account{due_date: 5, invoice: "Agua"},
      %Invoice.Account{due_date: 5, invoice: "Telefone"},
      %Invoice.Account{due_date: 5, invoice: "Luz"},
      %Invoice.Account{due_date: 10, invoice: "Agua"},
      %Invoice.Account{due_date: 10, invoice: "Telefone"},
      %Invoice.Account{due_date: 10, invoice: "Luz"},
      %Invoice.Account{due_date: 11, invoice: "Agua"},
      %Invoice.Account{due_date: 11, invoice: "Telefone"},
      %Invoice.Account{due_date: 11, invoice: "Luz"}
    ]
  end

  test "must be return list invoices ordened" do
    invoices = Invoice.make_invoice(["Agua", "Telefone", "Luz"], [5, 10, 11])

    refute Invoice.ordened_invoice(invoices) == [
      %Invoice.Account{due_date: 5, invoice: "Agua"},
      %Invoice.Account{due_date: 5, invoice: "Telefone"},
      %Invoice.Account{due_date: 5, invoice: "Luz"},
      %Invoice.Account{due_date: 10, invoice: "Agua"},
      %Invoice.Account{due_date: 10, invoice: "Telefone"},
      %Invoice.Account{due_date: 10, invoice: "Luz"},
      %Invoice.Account{due_date: 11, invoice: "Agua"},
      %Invoice.Account{due_date: 11, invoice: "Telefone"},
      %Invoice.Account{due_date: 11, invoice: "Luz"}
    ]
  end

end
