//
//  Question189.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//189. 轮转数组
//给定一个整数数组 nums，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。

func rotate(_ nums: inout [Int], _ k: Int) {
    let count = nums.count
    if count <= 1 { return }
    let availableK = k % count
    if availableK == 0 { return }
    
    var beginIdx = 0
    var offsetIdx = 0
    var offsetValue = nums[0]

    for _ in 0 ..< count{
        var targetIdx = offsetIdx + availableK
        if targetIdx >= count {
            targetIdx = targetIdx % count
        }
        let cacheoffsetValue = offsetValue
        offsetValue = nums[targetIdx]
        nums[targetIdx] = cacheoffsetValue
        if (targetIdx == beginIdx){
            offsetIdx = targetIdx + 1
            beginIdx = targetIdx + 1
            offsetValue = nums[beginIdx]
        } else {
            offsetIdx = targetIdx
        }

    }
}
