defmodule TableLookup do
  def in_bracket?(salary, bracket) do
    {lower, upper} = bracket
    salary > lower and salary <= upper
  end
end