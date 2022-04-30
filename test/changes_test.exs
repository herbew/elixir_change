defmodule ChangeTest do
    use ExUnit.Case
    
	test "1. No amount or and no coins" do
		assert Change.generate(nil, []) == {:error, "Any error with target!"}
		assert Change.generate(1, []) == {:error, "Any error list of coins!"}
		assert Change.generate(nil, [1]) == {:error, "Any error with target!"}
	end #test "1. No amount or and no coins" do
	
	@tag :pending
	test "2. The flexible coins with 1, [1,3,10]" do
		coins = [1,3,10]
		assert Change.generate(1, coins) == {:ok, [1]}
		assert Change.generate(8, coins) == {:ok, [1, 1, 3, 3]}
		assert Change.generate(14, coins) == {:ok, [1, 3, 10]}
	end #test "2. The flexible coins with 1, [1,3,10]" do
	
	@tag :pending
	test "3. The coins with error, [2,3,10]" do
		coins = [2,3,10]
		assert Change.generate(1, coins) == {:error, "cannot change"}
	end #test "3. The coins with error, [2,3,10]" do
	
end