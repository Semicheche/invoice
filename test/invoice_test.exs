defmodule InvoiceTest do
  use ExUnit.Case
  doctest Invoice

  test "greets the world" do
    assert Invoice.hello() == :world
  end
end
