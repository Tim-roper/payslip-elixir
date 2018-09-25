defmodule PayslipCalculator do
  @moduledoc "Calculates monthly salaray and tax"

  def monthly_pay(annual_salary) do
    annual_salary
      |> div(12)
      |> net_income(income_tax(annual_salary))
  end
  
  def income_tax(gross_income) do
    {base_rate, tax_free_amount, multiplier} = TaxTable.lookup(gross_income)
    gross_tax = base_rate + (gross_income - tax_free_amount) * multiplier
    gross_tax
      |> Float.ceil(0)
      |> trunc
      |> div(12)
  end

  def net_income(monthly_income, income_tax) do
    monthly_income - income_tax
  end

  def super(monthly_income, rate) do
    super_amount = monthly_income * rate
    super_amount |> round
  end

end
