defmodule TaxTable do

  # TODO
  def monthly_pay(annual_salary, super_rate) do
    net_income(gross_income(annual_salary), income_tax(3572, annual_salary, 37000, 0.325))
  end

end
