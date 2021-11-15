// Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
// A subarray is a contiguous part of an array.

// at each num, we have the subproblem:
// which is greater: the sum of the subarray if we include the current number
//  or the subarray if we start at the current number (sum + num > num?)
// start the subarray at the first num, its sum becomes that of the first num
// at each num, if the sum+num > num => sum += num
// else, sum = num
// then, set the max to (sum, max).max and return max when done

var maxSubArray = function (nums) {
  if (nums.length === 1) return nums[0];
  let sum = nums[0];
  let max = nums[0];
  for (let i = 1; i < nums.length; i++) {
    if (sum + nums[i] > nums[i]) {
      sum += nums[i];
    } else {
      sum = nums[i];
    }
    max = Math.max(sum, max);
  }
  return max;
};
