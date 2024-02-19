# Algo

* Don't recalculate x in algo while (eg `while() {array[i*x +y]}` => intead add `x` each iteration)
* TriCount algo = divide sum of everything by # of people, each's delta = that number - paid
* Pick Random Item = `items[Math.floor(Math.random() * items.length)]` (JavaScript)

## Glossary

* **Complément à 2**
  1. Use 1st bit as sign = `[-127,127]` on 8 bits, `[-32767,32767]` on 16 bits, but zero appears twice: _0000_ & _1000_
  2. Complément à 1 = invert all bits (still two zero's: 0000 & 1111)
  3. Complément à 2 = C1 + 1 => only one zero and add/sub also works (eg `1 - 1` = `0001 + (1110+1)` = `0000`)
* **Levenshtein distance** = measuring (insert/delete/substitute/swap operations) difference between two sequences, eg for spelling correction, DNA similarity (strings of proteins ACGT)
* **Bellman-Ford** = shortest path in a weighted graph

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
