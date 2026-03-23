class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        ans = []
        def re(cands, curr):
            if len(curr) == len(nums):
                ans.append(curr[:])
            for i in range(len(cands)):
                remain = cands[:i] + cands[i+1:]
                curr.append(cands[i])
                re(remain, curr)
                curr.pop()
        re(nums,[])
        return ans