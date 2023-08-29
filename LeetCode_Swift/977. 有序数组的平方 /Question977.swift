//
//  Question977.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//977. 有序数组的平方
//给你一个按 非递减顺序 排序的整数数组 nums，返回 每个数字的平方 组成的新数组，要求也按 非递减顺序 排序。

func sortedSquares(_ nums: [Int]) -> [Int] {
    if nums.isEmpty { return nums }
    var newNums = nums.map(){
        return $0 * $0
    }

    func sort(_ array: inout [Int], step: Int) {
        guard step > 0 else { return }
        let endIdx = array.count - 1
        var startIdx = 0
        while startIdx + step <= endIdx {
            var compareIdx = endIdx
            while compareIdx >= step {
                let stepIdx = compareIdx - step
                if stepIdx < startIdx { break }
                if array[stepIdx] > array[compareIdx] {
                    (array[stepIdx], array[compareIdx]) = (array[compareIdx], array[stepIdx])
                }
                compareIdx = stepIdx
            }
            startIdx += 1
        }
        sort(&array, step: step / 2)
    }
    sort(&newNums, step: newNums.count/2)
    return newNums
}
