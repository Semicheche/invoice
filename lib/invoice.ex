defmodule Invoice do
  @moduledoc """
    This Module execute functions from Invoices
  """

  @doc """
    Receive a `invoice` and return a array list
      ## Example:
      iex> Invoice.make_invoice(["Agua", "Telefone", "Luz"], [5, 10, 11])
      [
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
  """
  def make_invoice(invoices,  salaries) do
    #make two for but this form is euqual at method flatten
    for due_date <- salaries, invoice <- invoices do
        # " Invoice: #{invoice} due date: #{due} "     # <- Tem plate String
        %Invoice.Account{invoice: invoice, due_date: due_date} 
    end
  end 

  def invoice_payment(invoices, salaries, qty) do
    make_invoice(invoices, salaries)
    |> ordened_invoice
    |> invoice_to_be_paid(qty)
    |>save("invoices_saved")
  end

  @doc """
    Receive a invoices lists return `:ok`
      ##Example:
      iex> invoices = Invoice.make_invoice(["Agua", "Telefone", "Luz"], [5, 10, 11])
      iex> Invoice.save("invoices_bin", invoices)
      :ok
  """
  def save(invoices, file_name) do
      File.write(file_name, :erlang.term_to_binary(invoices))
  end

  def invoice_to_be_paid(invoices, qty) do
    Enum.split(invoices, qty)
  end
  @doc """
    Receive a `invoices list` and return a array list ordened
      ###Example:
      iex> invoices = Invoice.make_invoice(["Agua", "Telefone", "Luz"], [5, 10, 11])
      iex> Invoice.ordened_invoice(invoices)
      [
        %Invoice.Account{due_date: 5, invoice: "Agua"},
        %Invoice.Account{due_date: 5, invoice: "Luz"},
        %Invoice.Account{due_date: 5, invoice: "Telefone"},
        %Invoice.Account{due_date: 10, invoice: "Agua"},
        %Invoice.Account{due_date: 10, invoice: "Luz"},
        %Invoice.Account{due_date: 10, invoice: "Telefone"},
        %Invoice.Account{due_date: 11, invoice: "Agua"},
        %Invoice.Account{due_date: 11, invoice: "Luz"},
        %Invoice.Account{due_date: 11, invoice: "Telefone"}
      ]
  """
  def ordened_invoice(invoices) do
    Enum.sort(invoices)
  end

  def load(file_name) do
    {status, binary} = File.read(file_name)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "Cannot Found File " + file_name
    end
  end

  @doc """
    Receive a `invoices list` and  a `invoice` a return true if exist or False if not exist
      ## Example:
      iex> Invoice.invoice_exist?(Invoice.make_invoice(["Agua", "Telefone", "Luz"], [5, 10, 11]), %Invoice.Account{due_date: 11, invoice: "Luz"})
      true
  """
  def invoice_exist?(invoices, invoice) do
    Enum.member?(invoices, invoice)
  end

end
