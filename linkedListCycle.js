// Given head, the head of a linked list, determine if the linked list has a cycle in it.
// There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer.
// Return true if there is a cycle in the linked list. Otherwise, return false.

/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function (head) {
  // tortoise-hare algorithm
  // have two pointers, increment one by .next and the other by .next.next each time
  if (!head) return false;
  let fast, slow;
  fast = slow = head;
  while (fast && fast.next) {
    fast = fast.next.next;
    slow = slow.next;
    if (fast == slow) return true;
  }
  return false;
};
