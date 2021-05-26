defmodule DsAlgoTest do
  use ExUnit.Case
  doctest DsAlgo

  test "greets the world" do
    assert DsAlgo.hello() == :world
  end

  test "returns factorial" do
    assert DsAlgo.factorial(4) == 24
  end
end
