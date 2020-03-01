# Algo

* Don't recalculate x in algo while {while() {array[i*x +y]}} => add x each iteration

## Dynamic Programming

DP = Recursion + Memoization + guided Brute-force
Which means that we identify a set of initial base values and build the entire set from them (recursion), while caching intermediate values to avoid calculating the same thing twice (memoization).

E.g. Fibonacci algorithm
naive implementation is exponential time (inverted tree) since we compute the same Fi in different branches of the tree
DP implementation is linear time because # of subproblems for Fn is n and computation time for any subproblem is constant (simple call to hashtable or recursion). Any Fi is calculated only once.

DP = Try all the guesses = brute-force, carefully, take the best one

DP is good to calculate recursive structures such as Pascal triangle & Path finding (shortest path)

DAG = Directed Acyclic Graph (= graph with no loop)

### fibo.rb

```ruby
#!/usr/bin/ruby

def fibo_naive n
  return 1 if n <= 2
  return fibo_naive(n-1) + fibo_naive(n-2)
end
def fibo_memo memo, n  # Recursion & Memoization
  return memo[n] if memo.has_key?(n)
  if n <= 2
    fn = 1
  else
    fn = fibo_memo(memo, n-1) + fibo_memo(memo, n-2)
  end
  memo[n] = fn
  return fn
end
def fibo_memo_loop n  # Without recursion
  memo = {}
  for i in 1..n
    if i <= 2
      fi = 1
    else
      fi = memo[i-1] + memo[i-2]
    end
    memo[i] = fi
  end
  return memo[n]
end
def fibo_minmemo_loop n  # Minimising storage space (to last 2 values)
  f1 = 1
  f2 = 1
  for i in 3..n
    save = f2
    f2 = f1 + f2
    f1 = save
  end
  return f2
end

# Main

# Naive (Exponential time)
puts fibo_naive ARGV.first.to_i

# Recursion with Memo (Linear time, Linear space)
memo = {}  # Aptly named "memo", hence the term & Dynamic Programming technique "Memoization".
puts fibo_memo memo, ARGV.first.to_i

# Bottom-up loop Memo without recursion, same order of operations as recursive version (Linear time, Linear space)
puts fibo_memo_loop ARGV.first.to_i

# Same with minimal storage (Linear time, Constant space)
puts fibo_minmemo_loop ARGV.first.to_i
```
