defmodule ChangeTest do
    use ExUnit.Case
    
	test "1. No amount or and no coins" do
		assert Change.generate(nil, []) == :error
		assert Change.generate(1, []) == :error
		assert Change.generate(nil, [1]) == :error
	end #test "1. No amount or and no coins" do
	
	@tag :pending
	test "2. The flexible coins with 1, [1,3,10]" do
		coins = [1,3,10]
		assert Change.generate(1, coins) == {:ok, %{1 => 1, 3 => 0, 10 => 0}}
		assert Change.generate(8, coins) == {:ok, %{1 => 2, 3 => 2, 10 => 0}}
		assert Change.generate(14, coins) == {:ok, %{1 => 1, 3 => 1, 10 => 1}}
	end #test "2. The flexible coins with 1, [1,3,10]" do
	
	@tag :pending
	test "3. The coins with error, [2,3,10]" do
		coins = [2,3,10]
		assert Change.generate(1, coins) == :error
		assert Change.generate(7, coins) == :error
		assert Change.generate(14, coins) == :error
	end #test "3. The coins with error, [2,3,10]" do
	
	@tag :pending
	test "4. The coins with mix, [2,-3,10]" do
		coins = [2,-3,10]
		assert Change.generate(7, coins) == {:ok, %{-3 => 1, 2 => 5, 10 => 0}}
		assert Change.generate(11, coins) == {:ok, %{-3 => 1, 2 => 2, 10 => 1}}
		assert Change.generate(57, coins) == {:ok, %{-3 => 1, 2 => 5, 10 => 5}}
	end #test "4. The coins with mix, [2,-3,10]" do
	
end