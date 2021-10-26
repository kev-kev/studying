// we can solve by finding the pattern amongst subproblems
// at each table[i][j] we solve how many ways there are to make change for i given an array of denominations j

// n = 5, c = [1, 2, 5]
//             0  |  1  |  2  |  3  |  4  |  5  |
//        [] |
//       [1] |
//    [1, 2] |
// [1, 2, 5] |

// we know that we can make zero with no coin denominations, so table[0][i] = 1, i < c.length+1
// however, there's no way to make any positive value with no denominations, so table[0] from j=1 to the end must be 0

//             0  |  1  |  2  |  3  |  4  |  5  |
//        [] | 1     0     0     0     0     0
//       [1] | 1
//    [1, 2] | 1
// [1, 2, 5] | 1

// with c=[1] we can also only make change one way with each value of n
// moving on to c=[1, 2], if n=1, we can only use the 1 coin since 1-2 would be a negative int
//             0  |  1  |  2  |  3  |  4  |  5  |
//        [] | 1     0     0     0     0     0
//       [1] | 1     1     1     1     1     1
//    [1, 2] | 1     1
// [1, 2, 5] | 1

// now we need to ask: when c=[1, 2] and n=2..5, how many ways can we make n with 1 and 2?
// for n=2, if we don't use the 2 coin, we're asking the subproblem on the previous row, table[i-1][j]
//          if we do use the 2 coin, we only need to solve for the remaining value of n, table[i][j-c[i-1]]
//            here, we subtract the value of c at i-1 to grab the index, since we start at c=[]
//          so our relationship is table[i][j] = table[i-1][j] + table[i][j-c[i-1]]
//             0  |  1  |  2  |  3  |  4  |  5  |
//        [] | 1     0     0     0     0     0
//       [1] | 1     1     1     1     1     1
//    [1, 2] | 1     1     2     2     3     3
// [1, 2, 5] | 1     1     2     2     3     4

function getWays(n, c) {
  const table = new Array(c.length + 1);
  for (let i = 0; i < table.length; i++) {
    table[i] = new Array(n + 1);
  }

  table[0][0] = 1;

  for (let j = 1; j < n + 1; j++) {
    table[0][j] = 0;
  }

  for (let i = 1; i < table.length; i++) {
    for (let j = 0; j < n + 1; j++) {
      table[i][j] = (table[i - 1][j] || 0) + (table[i][j - c[i - 1]] || 0);
    }
  }
  return table[c.length][n];
}
