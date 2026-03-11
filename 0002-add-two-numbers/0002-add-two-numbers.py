# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        incre = 0
        ans = ListNode(0)
        head = ans
        while l1 and l2:
            summ = l1.val + l2.val + incre
            ans.val = summ % 10
            if summ > 9:
                incre = 1
            else:
                incre = 0
            l1 = l1.next
            l2 = l2.next
            if l1 and l2:
                ans.next = ListNode()
                ans = ans.next
        if incre == 0:
            if l1:
                ans.next = l1
            else:
                ans.next = l2
            return head
        temp = ListNode(0)
        if l1:
            temp = l1
        else:
            temp = l2
        while temp:
            ans.next = ListNode()
            ans = ans.next
            summ = temp.val + incre
            ans.val = summ % 10
            if summ > 9:
                incre = 1
            else:
                incre = 0
            temp = temp.next
        if incre == 1:
            ans.next = ListNode(1)
        return head
            