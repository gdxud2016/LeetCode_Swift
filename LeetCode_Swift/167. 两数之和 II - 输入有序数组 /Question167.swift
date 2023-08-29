//
//  Question167.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//167. 两数之和 II - 输入有序数组
//给你一个下标从 1 开始的整数数组 numbers ，该数组已按 非递减顺序排列  ，请你从数组中找出满足相加之和等于目标数 target 的两个数。如果设这两个数分别是 numbers[index1] 和 numbers[index2] ，则 1 <= index1 < index2 <= numbers.length 。
//
//以长度为 2 的整数数组 [index1, index2] 的形式返回这两个整数的下标 index1 和 index2。
//
//你可以假设每个输入 只对应唯一的答案 ，而且你 不可以 重复使用相同的元素。
//
//你所设计的解决方案必须只使用常量级的额外空间。

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    return twoSum1(numbers, from: 0, to: numbers.count - 1, target)
}

func twoSum1(_ numbers: [Int], from: Int, to: Int, _ target: Int) -> [Int] {
    let count = numbers.count
    guard count > 1, to >= from, from >= 0, to < count else { return [] }
    // 7 , 1 ,3
    for idx in from ... to {
        let obj = numbers[idx]
        let otherValue = target - obj
        if let otherIdx = findValue(otherValue, numbers: numbers, minIdx: idx + 1, maxIdx: to) {
            return [idx + 1, otherIdx + 1]
        }
    }
    return []
}

func findValue(_ value: Int, numbers: [Int],minIdx: Int, maxIdx: Int) -> Int? {
    guard minIdx <= maxIdx else { return nil }
    let middleIdx = (minIdx + maxIdx) / 2
    let middleValue = numbers[middleIdx]
    if middleValue > value {
        return findValue(value, numbers: numbers, minIdx: minIdx, maxIdx: middleIdx - 1)
    } else if middleValue == value {
        return middleIdx
    } else {
        return findValue(value, numbers: numbers, minIdx: middleIdx + 1, maxIdx: middleIdx)
    }
}
