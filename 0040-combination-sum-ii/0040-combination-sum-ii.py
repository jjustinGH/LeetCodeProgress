class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        ans = []
        candidates.sort()
        def re(cands, curr):
            for i in range(len(cands)):
                if i > 0 and cands[i] == cands[i - 1]:
                    continue
                if sum(curr) + cands[i] < target:
                    curr.append(cands[i])
                    re(cands[i+1:], curr)
                    curr.pop()
                elif sum(curr) + cands[i] == target:
                    curr.append(cands[i])
                    ans.append(curr[:])
                    curr.pop()
                    break
                else:
                    break
        re(candidates,[])
        return ans
                