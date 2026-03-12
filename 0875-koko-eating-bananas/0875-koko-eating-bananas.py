class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        import math
        ceil = max(piles)
        if h == len(piles):
            return ceil
        req = h // len(piles)
        left = 1
        right = ceil
        while left <= right:
            total = 0
            rate = (left + right) // 2
            for pile in piles:
                total += math.ceil(pile / rate)
            if total > h:
                left = rate + 1
            else:
                right = rate
            if left == right:
                return right
            
