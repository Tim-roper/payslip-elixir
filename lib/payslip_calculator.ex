defmodule PayslipCalculator do
  @moduledoc "Calculates monthly salaray and tax"

  def monthly_pay(annual_salary, super_rate) do
    net_income(gross_income(annual_salary), income_tax(3_572, annual_salary, 37_000, 0.325))
  end

  def gross_income(annual_salary) do
    round(annual_salary / 12)
  end

  def income_tax(base_rate, gross_income, tax_free_amount, multiplier) do
    # {base_rate, tax_free_amount, multiplier} = tax_table.lookup(gross_income)
    round((base_rate + (gross_income - tax_free_amount) * multiplier) / 12)
  end

  def net_income(gross_income, income_tax) do
    gross_income - income_tax
  end

  def super(gross_income, percentage) do
    round(gross_income * percentage)
  end

end
