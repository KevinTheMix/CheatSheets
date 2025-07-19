# Algo

## Quick Tips

* Don't recalculate x in algo while (eg `while() {array[i*x +y]}` => instead add `x` each iteration)
* TriCount algo = divide sum of everything by # of people, each's delta = that number - paid
* Pick Random Item = `items[Math.floor(Math.random() * items.length)]` (JavaScript)
* MIT OpenCourseWare
  * [Lecture 19: Dynamic Programming I: Fibonacci, Shortest Paths](https://www.youtube.com/watch?v=OQ5jsbhAv_M) = recursion + memoization
  * [Lecture 20: Dynamic Programming II: Text Justification, Blackjack](https://www.youtube.com/watch?v=ENyox7kNKeY)
  * [Lecture 21: Dynamic Programming III: Parenthesization, Edit Distance, Knapsack](https://www.youtube.com/watch?v=ocZMDMZwhCY)
  * [Lecture 22: Dynamic Programming IV: Guitar Fingering, Tetris, Super Mario Bros.](https://www.youtube.com/watch?v=tp4_UXaVyx8)
* [Flow Field Pathfinding for Tower Defense](https://www.redblobgames.com/pathfinding/tower-defense) = A* visualization
* [What is the alphanumeric id in a reddit URL?](http://stackoverflow.com/questions/410485/whats-the-5-character-alphanumeric-id-in-reddit-url) = base 36 (ie lowercase alphanumeric)
* [Visualizing algorithmes](https://bost.ocks.org/mike/algorithms)

## Glossary

* **Alpha-beta pruning** = search algorithm that stops evaluating a move (and its search path subtree) when it is estimated to be worse than a previously examined move
* **Bellman-Ford** = shortest path in a weighted graph
* **Complément à 2**
  1. Use 1st bit as sign = `[-127,127]` on 8 bits, `[-32767,32767]` on 16 bits, but zero appears twice: _0000_ & _1000_
  2. Complément à 1 = invert all bits (still two zero's: 0000 & 1111)
  3. Complément à 2 = C1 + 1 => only one zero and add/sub also works (eg `1 - 1` = `0001 + (1110+1)` = `0000`)
* **Dijkstra's algorithm** = find shortest path between nodes in a weighted graph
* **Loop invariant** = a property of a loop true before & after each iteration (eg an overall expression that stays true even though its constituting variables get updated)
* String distances = for spelling correction, DNA ACGT proteins similarity
  * **Levenshtein distance** = string metric measuring difference between two sequences, ie minimum number of single-character edits (insertions, deletions or substitutions)
  * **Damerau-Levenshtein distance** = Levenshtein distance + substitutions & transpositions (aka permutations)
* **Memoization** = optimization technique that stores result of expensive function calls to produce same outputs for same future inputs
* **Rope** = binary tree data structure used to store longer strings as smaller linked ones (eg used by text editors)
* **Sort**
  * **Merge** = O(n log n)
* **Trie** = k-ary tree data structure digital/prefix search tree, usually with string keys (eg for autocomplete/predictive text)

## Coins

* Problem = number of coins needed to reach a total
* Coins = 1, 5, 6, 8
* Total = 11

| $ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 |
| - | - | - | - | - | - | - | - | - | - | - | -- | -- |
| 1 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 |
| 5 | 0 | 1 | 2 | 3 | 4 | 1 | 2 | 3 | 4 | 5 |  2 |  3 |
| 6 | 0 | 1 | 2 | 3 | 4 | 1 | 1 | 2 | 3 | 4 |  2 |  2 |
| 8 | 0 | 1 | 2 | 3 | 4 | 1 | 1 | 2 | 1 | 2 |  2 |  2 |

* Algo = top left -> right down
  * `V[i,0] = 0` (header column)
  * `V[0,j] = j` (header row)
  * `V[1,j] = j` ($1 coins)
  * `V[i,j] = min(V[i-1,j], V[i,j-Ci]+1)` = either take the current minimum (one line above), or find a new minimum for this coin
* Calculate = Pascal triangle, (Path finding), Summed, Shortest path
