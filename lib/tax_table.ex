defmodule TaxTable do
  @moduledoc "Represent a a table of taxation amounts"
  # {base_rate, tax_free_amount, multiplier} = tax_table.lookup(gross_income)
  
  @max_salary 999_999_999

  @table %{
    {0, 18_000} => {0, 0, 0},
    {18_201, 37_000} => {0, 18_200, 0.19},
    {37_001, 80_000} => {3572, 37_000, 0.325},
    {80_001, 180_000} => {17_547, 80_000, 0.37},
    {180_001, @max_salary} => {54_547, 180_000, 0.45}
  }

  def lookup(gross_salary) do
    Map.get(@table, get_bracket(gross_salary))
  end

  def get_bracket(gross_salary) do
    Enum.find(Map.keys(@table), fn x -> elem(x, 0) <= gross_salary && elem(x, 1) > gross_salary end) 
  end

  def get_max_salary() do
    @max_salary
  end

  def get_tax_brackets() do
    Map.keys(@table)
  end

end
