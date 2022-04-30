defmodule Change do
    @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}
    """

    @spec generate(integer, list) :: {:ok, list} | {:error, String.t()}
    def generate(target, list_coins) do
		cond do
		  target == nil -> {:error, "Any error with target!"}
		  list_coins == [] -> {:error, "Any error list of coins!"}
		  true -> 
			  change([{[], 0}], list_coins, target)
		end
	end

    @spec change(list, list, integer) :: {:ok, list} | {:error, String.t()}
    defp change(list_change, list_coins, target) do
        list_change = add_coin(list_change, list_coins, target)
        target_change = Enum.find(list_change, fn {_, sum} -> sum == target end)

        cond do
            target_change ->
            {coins, _} = target_change
            {:ok, Enum.reverse(coins)}
              

            length(list_change) == 0 ->
            {:error, "cannot change"}

            true ->
            change(list_change, list_coins, target)
        end
    end

        
    @spec add_coin(list, list, integer) :: list
    defp add_coin(list_change, list_coins, target) do
        for(
            {coins, sum} <- list_change,
            head_coin = (coins != [] && hd(coins)) || 0,
            new_coin <- list_coins,
            new_coin >= head_coin and sum + new_coin <= target,
            do: {[new_coin | coins], sum + new_coin}
        )
    end

end