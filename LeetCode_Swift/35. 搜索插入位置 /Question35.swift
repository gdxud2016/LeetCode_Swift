//
//  Question35.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//35. 搜索插入位置
//给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
//请必须使用时间复杂度为 O(log n) 的算法。
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums.isEmpty { return 0 }
    if nums.first! > target { return 0 }
    if nums.last! < target { return nums.count }
    var minIdx = 0
    var maxIdx = nums.count - 1
    while maxIdx >= minIdx {
        let mid = (maxIdx + minIdx) / 2
        if nums[mid] > target {
            maxIdx = mid - 1
        } else if nums[mid] == target {
            return target
        } else {
            minIdx = mid + 1
        }
    }
    return minIdx
}
