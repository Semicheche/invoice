defmodule Invoice do
  @moduledoc """
    This Module execute functions from Invoices
  """

  @doc """
    Receive a `invoice` and return a array list
      ## Example:
      iex> Invoice.make_invoice(["Agua", "Telefone", "Luz"])
      ["Agua", "Telefone", "Luz"]
  """
  def make_invoice(invoices,  salaries) do
    #make two for but this form is euqual at method flatten
    for due <- salaries, invoice <- invoices do
        " Invoice: #{invoice} due date: #{due} "     # <- Template String
    end
  end

  def save(file_name, invoices) do
      File.write(file_name, :erlang.term_to_binary(invoices))
  end

  def invoice_to_be_paid(invoices, qty) do
    Enum.split(invoices, qty)
  end
  @doc """
    Receive a `invoices list` and return a array list ordened
      ## Example:
      iex> Invoice.ordened_invoice(Invoice.make_invoice(["Agua", "Telefone", "Luz"]))
      ["Agua", "Luz", "Telefone"]
  """
  def ordened_invoice(invoices) do
    Enum.sort(invoices)
  end

  @doc """
    Receive a `invoices list` and  a `invoice` a return true if exist or False if not exist
      ## Example:
      iex> Invoice.invoice_exist?(Invoice.make_invoice(["Agua", "Telefone", "Luz"]), "Luz")
      true
  """
  def invoice_exist?(invoices, invoice) do
    Enum.member?(invoices, invoice)
  end

end
