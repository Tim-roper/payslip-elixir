defmodule PayslipCalculatorTest do
  use ExUnit.Case

  import Mock

  test "Calculates the payslip" do
    with_mock TaxTable, [lookup: fn(_) -> {3572, 37_000, 0.325} end] do 
      assert PayslipCalculator.monthly_pay(60_050, 0.09) == 4082
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
      assert PayslipCalculator.income_tax(3572, 60_050, 37_000, 0.325) == 922
    end
  end

end
