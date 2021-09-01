# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists_iterative(l1, l2)
  # setting res to the same address as the working ListNode cur
  # that way, once im done building the linked list with cur, i can return the list starting from res.next
  res = cur = ListNode.new()
  p res, cur
  while l1 && l2
      if l1.val < l2.val
          cur.next = l1
          l1 = l1.next
      else
          cur.next = l2
          l2 = l2.next
      end
      cur = cur.next
  end
  # tacks on any leftover list
  cur.next = l1 || l2
  res.next
end

def merge_two_lists_recursive(l1, l2)
  # base cases- l1 or l2 are nil
  return l1 || l2 if !l1 || !l2
  if l1.val < l2.val
     l1.next = merge_two_lists_recursive(l1.next, l2) 
      return l1
  else
      l2.next = merge_two_lists_recursive(l1, l2.next)
      return l2
  end
end