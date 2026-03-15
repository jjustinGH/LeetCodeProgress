class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        ans = []
        def re(cands: List[int], curr: List[int]):
            ans.append(curr[:])
            for i in range(len(cands)):
                curr.append(cands[i])
                re(cands[i+1:],curr)
                curr.pop()
        re(nums,[])
        return ans