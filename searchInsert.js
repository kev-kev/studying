// Given a sorted array of distinct integers and a target value, return the index if the target is found.
// If not, return the index where it would be if it were inserted in order.

// since we have a sorted array of ints, we can use binary search to find the target in O(log n) time
// we also dont know if target is in nums or not, so need to look while start < end rather than <=, since the bounds can become equal, causing an infinite loop
// if we end up shrinking our subarray and our target is not found, can just return that index that we converge upon

var searchInsert = function (nums, target) {
  if (target > nums[nums.length - 1]) return nums.length;
  if (target < nums[0]) return 0;
  let start = 0,
    end = nums.length - 1;
  while (start < end) {
    let mid = Math.floor((start + end) / 2);
    if (nums[mid] === target) return mid;
    else if (end - start < 1) return start + 1;
    else if (nums[mid] < target) start = mid + 1;
    else end = mid;
  }
  return start;
};
