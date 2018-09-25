defmodule PayslipCalculator do
  @moduledoc "Calculates monthly salaray and tax"

  def monthly_pay(annual_salary) do
    net_income(gross_income(annual_salary), income_tax(annual_salary))
  end

  def gross_income(annual_salary) do
    annual_salary |> div(12)
  end

  def income_tax(gross_income) do
    {base_rate, tax_free_amount, multiplier} = TaxTable.lookup(gross_income)
    round((base_rate + (gross_income - tax_free_amount) * multiplier) / 12)
  end

  def net_income(gross_income, income_tax) do
    gross_income - income_tax
  end

  def super(gross_income, rate) do
    round(gross_income * rate)
  end

end
