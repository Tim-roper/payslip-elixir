defmodule PayslipCalculatorTaxTableIntegrationTest do
  use ExUnit.Case

  test "Calculates the payslip" do
    assert PayslipCalculator.monthly_pay(60_050, 0.09) == 4082
  end
    
  test "Calculates the net income" do
    assert PayslipCalculator.net_income(5004, 922) == 4082
  end

  test "Calculates the superannuation" do
    assert PayslipCalculator.super(5004, 0.09) == 450
  end

  test "Calculates the income tax" do
    assert PayslipCalculator.income_tax(3572, 60_050, 37_000, 0.325) == 922
  end

end
