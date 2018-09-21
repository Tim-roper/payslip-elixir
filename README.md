# WageCalculator

**Elixir implementation of the payslip problem**

## Details

Read the [Problem statement](./requirements.md)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `payslip_calculator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:payslip_calculator, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/payslip_calculator](https://hexdocs.pm/payslip_calculator).

## TODO
* Check the terminology for everything eg. **lump sum**
* Refactor Calculator tests to be grouped and defined (currently in single test)
* Property-based testing
* Add Pipe operator to calculation functions
