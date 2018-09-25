defmodule PayslipCalculatorTest do
  use ExUnit.Case
  use ExUnitProperties

  import Mock

  test "Calculates the payslip" do
    with_mock TaxTable, [lookup: fn(_) -> {3572, 37_000, 0.325} end] do 
      assert PayslipCalculator.monthly_pay(60_050) == 4082
    end
  end
    
  test "Calculates the net income" do
    with_mock TaxTable, [lookup: fn(_) -> {3572, 37_000, 0.325} end] do 
      assert PayslipCalculator.net_income(5004, 922) == 4082
    end
  end

  test "Calculates the superannuation" do
    with_mock TaxTable, [lookup: fn(_) -> {3572, 37_000, 0.325} end] do 
      assert PayslipCalculator.super(5004, 0.09) == 450
    end
  end

  test "Calculates the income tax" do
    with_mock TaxTable, [lookup: fn(_) -> {3572, 37_000, 0.325} end] do 
      assert PayslipCalculator.income_tax(60_050) == 922
    end
  end

  property "monthly_pay returns a positive salary" do
    check all annual_salary <- integer(0..TaxTable.get_max_salary),
              super_rate <- float(min: 0, max: 1),
              pay = PayslipCalculator.net_income(annual_salary, super_rate) do
       assert pay > 0
    end
  end

end
