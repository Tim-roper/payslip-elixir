defmodule TableLookupTest do
  use ExUnit.Case
  use ExUnitProperties

  test "Returns true when the salary is within the bracket" do
    assert TableLookup.in_bracket?(7000, {0, 10_000}) == true
    assert TableLookup.in_bracket?(1000, {0, 1000}) == true
    assert TableLookup.in_bracket?(77_000_000, {10_000_000, 80_000_000}) == true
  end

  test "Returns false when the salary is not within the bracket" do
    assert TableLookup.in_bracket?(7000, {10_000, 100_000}) == false
    assert TableLookup.in_bracket?(1000, {11_000, 20_000}) == false
    assert TableLookup.in_bracket?(77_000_000, {80_000_000, 82_000_000}) == false
  end

end
