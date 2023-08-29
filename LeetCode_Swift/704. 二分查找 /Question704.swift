//
//  Question704.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//704. 二分查找
//给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。

func search(_ nums: [Int], _ target: Int) -> Int {
    var result = -1
    var minIdx = 0
    var maxIdx = nums.count - 1

    while maxIdx >= minIdx {
        let middle = (minIdx + maxIdx) / 2
        let middleValue = nums[middle]
        if middleValue > target {
            maxIdx = middle - 1
        } else if middleValue == target {
            result = middle
            break
        } else {
            minIdx = middle + 1
        }
    }
    return result
}
