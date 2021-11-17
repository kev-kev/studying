// Given two strings text1 and text2, return the length of their longest common subsequence.
// If there is no common subsequence, return 0.

// can break down into base cases of LCS(x, x) = 1, LCS('', x) = 0
// can make a table with the first row and column = 0 since an empty string will result in 0 every time
// since we also know that LCS(str1+x, str2+x) = LCS(str1+str2) + LCS(x, x) = LCS(str1+str2) + 1...
//  that means if we find a match, we can take the value of the substrings without the matching letter and add 1 to it
// if we don't have a match, we can take the max of the values at the previous column and the previous row

var longestCommonSubsequence = function (text1, text2) {
  const table = [];
  for (let i = 0; i < text1.length + 1; i++) {
    table[i] = [];
  }

  for (let i = 0; i < text1.length + 1; i++) {
    for (let j = 0; j < text2.length + 1; j++) {
      if (i === 0 || j === 0) {
        table[i][j] = 0;
      } else if (text1[i - 1] === text2[j - 1]) {
        table[i][j] = table[i - 1][j - 1] + 1;
      } else {
        table[i][j] = Math.max(table[i - 1][j], table[i][j - 1]);
      }
    }
  }
  return table[text1.length][text2.length];
};
