class Solution:
    def search(self, nums: List[int], target: int) -> int:
        head = 0
        half = int(len(nums) / 2)
        end = len(nums) - 1
        if target == nums[head]:
            return 0
        if target >= nums[half]:
            for i in range(half,end + 1):
                if nums[i] == target:
                    return i
        else:
            for i in range(half):
                if nums[i] == target:
                    return i
        return -1