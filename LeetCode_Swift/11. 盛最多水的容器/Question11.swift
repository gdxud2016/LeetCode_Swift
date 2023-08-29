//
//  Question11.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//11. 盛最多水的容器
//给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。
//找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
//返回容器可以储存的最大水量。

func maxArea(_ height: [Int]) -> Int {
    let count = height.count
    if count <= 1 { return 0 }
    
    var startIdx:Int = 0
    var endIdx:Int = count - 1
    var result:Int = 0
    while startIdx < endIdx {
        let startValue:Int = height[startIdx]
        let endValue:Int = height[endIdx]
        let current = (endIdx - startIdx) * min(startValue, endValue)
        if result < current{
            result = current
        }
        if startValue <= endValue {
            startIdx += 1
        } else {
            endIdx -= 1
        }
    }
    return result
}

