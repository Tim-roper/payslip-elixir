defmodule PayslipCalculatorTest do
  use ExUnit.Case

  test "Calculates the payslip" do
    assert PayslipCalculator.calculate() == :world
  end
end
