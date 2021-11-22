// Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

// can just do nums.map(n => x**2).sort((a, b) => a-b) but thats trivial
// since we're squaring, we know the largest nums in the output need be the most positive and the most negative nums in our sorted input
// so we can build a sorted output using two pointers, one at the start of the arr and one at the end
// at each iteration, choose the num at either end thats larger after being squared, then walk the pointer inward

var sortedSquares = function (nums) {
  const res = [];
  let start = 0,
    end = nums.length - 1;
  for (let i = nums.length - 1; i >= 0; i--) {
    if (Math.abs(nums[start]) < Math.abs(nums[end])) {
      res[i] = nums[end] ** 2;
      end--;
    } else {
      res[i] = nums[start] ** 2;
      start++;
    }
  }
  return res;
};
