defmodule Change do
	@doc """
	Determine the least number of coins to be given to the user such
	that the sum of the coins' value would equal the correct amount of map_change.
	It returns :error if it is not possible to compute the right amount of coins.
	Otherwise returns the tuple {:ok, map_of_coins}
	
	## Examples
	
	 iex> Change.generate(3, [5, 10, 15])
	 :error
	
	 iex> Change.generate(18, [1, 5, 10])
	 {:ok, %{1 => 3, 5 => 1, 10 => 1}}
	
	"""
	
	@spec generate(integer, list) :: {:ok, map} | :error
	def generate(amount, values) do
		cond do
		  amount == nil or amount <= 0 or values == [] -> :error
		  true -> 
			  change(
				   amount,
				   
				   # sort(enumerable, fun)
				   # Sorts the enumerable by the given function.
				   # &(&2 < &1) is anonymous function if params 2 < params 1
				   Enum.sort(values, &(&2 < &1)),
				   
				   # into(enumerable, collectable, transform)
				   # Inserts the given enumerable into a collectable according to the transformation function.
				   Enum.into(values, %{ }, &{&1, 0})
			 )
		end
		 
	end
	
	# Private function 3 params (
	# amount is 0, 
	# list<Used to ignore an argument or part of a pattern match expression>, 
	# map)
	defp change(0, _values, map_change), do: {:ok, map_change}
	
	# Private function 3 params (amount, list, map)
	defp change(amount, values, map_change) do
		# find(enumerable, default \\ nil, fun)
		# Returns the first element for which fun returns a truthy value. 
		# If no such element is found, returns default.
		case Enum.find(values, fn value -> value <= amount end) do
			nil ->
			  :error
			coin ->
			  change(
			    amount - coin,
			    values,
			    # update!(map, key, fun)
			    # &(&1 + 1) is anonymous function fn(x) -> x + 1 end
			    Map.update!(map_change, coin, &(&1 + 1))
			  )
		end
	end
  
end
