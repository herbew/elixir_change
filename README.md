# Elixir Change - Algorithm
Correctly determine the fewest number of coins to be given to a customer 
such that the sum of the coins' value would equal the correct amount of change.

## Edge cases
- Does your algorithm work for any given set of coins?
- Can you ask for negative change?
- Can you ask for a change value smaller than the smallest coin value?


## mix test
Excluding tags: [:pending]

ChangeTest [test/changes_test.exs]
  * test 4. The coins with mix, [2,-3,10] (excluded) [L#27]
  * test 3. The coins with error, [2,3,10] (excluded) [L#19]
  * test 2. The flexible coins with 1, [1,3,10] (excluded) [L#11]
  * test 1. No amount or and no coins (0.00ms) [L#4]

Finished in 0.02 seconds (0.00s async, 0.02s sync)
4 tests, 0 failures, 3 excluded

## mix test --include pending
Including tags: [:pending]

ChangeTest [test/changes_test.exs]
  * test 3. The coins with error, [2,3,10] (1.5ms) [L#19]
  * test 1. No amount or and no coins (0.00ms) [L#4]
  * test 4. The coins with mix, [2,-3,10] (0.01ms) [L#27]
  * test 2. The flexible coins with 1, [1,3,10] (0.00ms) [L#11]

Finished in 0.03 seconds (0.00s async, 0.03s sync)
4 tests, 0 failures
