defmodule PayslipCalculatorTaxTableIntegrationTest do
  use ExUnit.Case
  use ExUnitProperties

  test "Calculates the payslip" do
    assert PayslipCalculator.monthly_pay(60_050) == 4082
  end
    
  test "Calculates the income tax" do
    assert PayslipCalculator.income_tax(60_050) == 922
  end

  property "Monthly Pay is a positive integer" do
    check all annual_salary <- integer(0..TaxTable.get_max_salary),
              pay = PayslipCalculator.monthly_pay(annual_salary) do
       assert pay > 0
    end
  end

  property "Monthly Pay is less than salary" do
    check all annual_salary <- integer(0..TaxTable.get_max_salary),
              pay = PayslipCalculator.monthly_pay(annual_salary) do
       assert pay < annual_salary
    end
  end

end
