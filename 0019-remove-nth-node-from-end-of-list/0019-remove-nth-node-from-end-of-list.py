# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        curr = head
        fast = head
        temp = n
        if head.next == None:
            return None
        while temp != 0:
            fast = fast.next
            temp -= 1
        if fast == None:
            return head.next
        while fast and fast.next:
            curr = curr.next
            fast = fast.next
        if n > 1:
            curr.next = curr.next.next
        else:
            curr.next = None
        return head

        