//
//  Question283.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//283. 移动零
//给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
//
//请注意 ，必须在不复制数组的情况下原地对数组进行操作。

func moveZeroes(_ nums: inout [Int]) {
    let count = nums.count
    guard count > 1 else { return }
    var currentIdx = 0
    for (idx,obj) in nums.enumerated() {
        if obj != 0 {
            nums[currentIdx] = nums[idx]
            currentIdx += 1
        }
    }
    guard currentIdx < count else { return }
    for idx in currentIdx ..< count {
        nums[idx] = 0
    }
}
