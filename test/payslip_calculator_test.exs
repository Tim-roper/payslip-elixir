defmodule PayslipCalculatorTest do
  use ExUnit.Case

  test "Calculates the payslip" do
    assert PayslipCalculator.monthly_pay(60050, 0.09) == 4082
    assert PayslipCalculator.gross_income(60050) == 5004
    assert PayslipCalculator.income_tax(3572, 60050, 37000, 0.325) == 922
    assert PayslipCalculator.net_income(5004, 922) == 4082
    assert PayslipCalculator.super(5004, 0.09) == 450
  end

end
