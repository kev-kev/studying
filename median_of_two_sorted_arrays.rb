# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}

def find_median_sorted_arrays(nums1, nums2)
  merged = []
  i = j = 0
  while nums1[i] && nums2[j]
      if nums1[i] <= nums2[j]
          merged << nums1[i] 
          i += 1
      elsif nums2[j] <= nums1[i]
          merged << nums2[j] 
          j += 1
      end
  end
  if nums1[i]
      merged += nums1[i..-1]
  elsif nums2[j]
      merged += nums2[j..-1]
  end
  length = merged.length
  if length % 2 == 0
      index = (length / 2)
      (merged[index] + merged[index - 1]) / 2.0
  else
      index = (length / 2).floor
      merged[index].to_f
  end
end