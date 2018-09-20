defmodule TaxTableTest do
  use ExUnit.Case

  test "Returns the lump sum" do
    assert TaxTable.super(5004, 0.09) == 450
  end

end
