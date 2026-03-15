class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        ans = []
        nums.sort()
        def re(cands: List[int], curr: List[int]):
            ans.append(curr[:])
            for i in range(len(cands)):
                if i > 0 and cands[i] == cands[i - 1]:
                    continue
                curr.append(cands[i])
                re(cands[i+1:],curr)
                temp = curr.pop()
        re(nums,[])
        return ans
