# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

# You may assume the two numbers do not contain any leading zero, except the number 0 itself.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  res = []
  remainder = false
  prev_index = nil
  while l1|| l2 || remainder do 
      sum = ListNode.new((l1 ? l1.val : 0)  + (l2 ? l2.val : 0))
      sum.val += 1 if remainder
      remainder = false
      if sum.val > 9
          sum.val -= 10
          remainder = true
      end
      res.push(sum)
      if prev_index === nil 
           prev_index = 0
      else   
          res[prev_index].next = sum
          prev_index += 1 
      end
      l1 = l1.next if l1
      l2 = l2.next if l2
  end
  res[0]
end
