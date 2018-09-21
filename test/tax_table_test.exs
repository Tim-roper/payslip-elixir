defmodule TaxTableTest do
  use ExUnit.Case

  test "Returns the tax table components" do
    # assert TaxTable.lookup(7000) = {0, 00}
    # assert TaxTable.lookup(19_000) = {0, 18_200, 0.19}
    # assert TaxTable.lookup(60_050) = {3572, 37_000, 0.325}
    # assert TaxTable.lookup(110_000) = {17_547, 80_000, 0.37}
    # assert TaxTable.lookup(200_000) = {54_547, 180_000, 0.45}
  end

  test "Finds the correct key for the gross salary" do
    assert TaxTable.get_bracket(1500) == {0, 18_000}
    assert TaxTable.get_bracket(20_000) == {18_201, 37_000}
    assert TaxTable.get_bracket(60_050) == {37_001, 80_000}
    assert TaxTable.get_bracket(120_000) == {80_001, 180_000}
    assert TaxTable.get_bracket(250_000) == {180_001, TaxTable.get_max_salary}
  end

end
