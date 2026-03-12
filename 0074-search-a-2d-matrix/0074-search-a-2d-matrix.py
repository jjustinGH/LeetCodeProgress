class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        row_len = len(matrix)
        col_len = len(matrix[0])
        mid = row_len // 2
        print(row_len, col_len, mid)
        if target < matrix[mid][0]:
            i = mid
            while matrix[i][0] > target and i > 0:
                i -= 1
            for j in range(col_len):
                if target == matrix[i][j]:
                    return True
        else:
            i = mid
            while matrix[i][col_len - 1] < target and i < row_len - 1:
                i += 1
            for j in range(col_len):
                if target == matrix[i][j]:
                    return True
        return False
