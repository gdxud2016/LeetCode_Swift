//
//  Qustion136.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//136. 只出现一次的数字
//给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
//你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

func singleNumber(_ nums: [Int]) -> Int {
    var numSet = Set<Int>()
    for idx in nums {
        if numSet.contains(idx) {
            numSet.remove(idx)
            continue
        }
        numSet.insert(idx)
    }
    return numSet.first ?? 0
}
