defmodule TaxTableTest do
  use ExUnit.Case
  use ExUnitProperties

  test "Returns the tax table components" do
    assert TaxTable.lookup(7000) == {0, 0, 0}
    assert TaxTable.lookup(19_000) == {0, 18_200, 0.19}
    assert TaxTable.lookup(60_050) == {3572, 37_000, 0.325}
    assert TaxTable.lookup(110_000) == {17_547, 80_000, 0.37}
    assert TaxTable.lookup(200_000) == {54_547, 180_000, 0.45}
  end

  property "Valid salaries have an associated base rate" do
    check all gross_salary <- integer(0..TaxTable.get_max_salary),
              {base_rate, _, _} = TaxTable.lookup(gross_salary) do
       assert base_rate >= 0
    end
  end

  property "Valid salaries have an associated tax free amount" do
    check all gross_salary <- integer(0..TaxTable.get_max_salary),
              {_, tax_free_amount, _} = TaxTable.lookup(gross_salary) do
       assert tax_free_amount >= 0
    end
  end

  property "Valid salaries have an associated multipler" do
    check all gross_salary <- integer(0..TaxTable.get_max_salary),
              {_, _, multiplier} = TaxTable.lookup(gross_salary) do
       assert multiplier >= 0.0
       assert multiplier < 1.0
    end
  end

end
