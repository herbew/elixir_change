defmodule ChangeTest do
    use ExUnit.Case
    
	test "1. No cent or and no coins" do
	  assert Change.generate(nil, []) == :error
	  assert Change.generate(1, []) == :error
	  assert Change.generate([nil [1]) == :error
	end #test "1. No cent or and no coins" do
	
end