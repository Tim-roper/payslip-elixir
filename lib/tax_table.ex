defmodule TaxTable do
  @moduledoc "Represent a a table of taxation amounts"

  @max_salary 999_999_999

  @table %{
    {0, 18_000} => {0, 0, 0},
    {18_201, 37_000} => {0, 18_200, 0.19},
    {37_001, 80_000} => {3572, 37_000, 0.325},
    {80_001, 180_000} => {17_547, 80_000, 0.37},
    {180_001, @max_salary} => {54_547, 180_000, 0.45}
  }

  def lookup(gross_salary) do
    {_, values} = Enum.find(@table, fn x -> TableLookup.in_bracket?(gross_salary, elem(x, 0)) end)
    values
  end

  def get_max_salary() do
    @max_salary
  end

  def get_tax_brackets() do
    Map.keys(@table)
  end

end
