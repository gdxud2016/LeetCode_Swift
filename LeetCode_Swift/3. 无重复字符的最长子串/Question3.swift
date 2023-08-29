//
//  Question3.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//3. 无重复字符的最长子串
//给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。
func lengthOfLongestSubstring(_ s: String) -> Int {
    var charDict:[Character:Int] = Dictionary()
    let charsArr = Array(s)
    var startIdx = 0
    var resultRange = (0,0)
    let charsCount = charsArr.count
    for i in 0 ..< charsCount{
        let charAt = charsArr[i]
        if let repeatIdx = charDict[charAt] {
            if repeatIdx >= startIdx {
                if resultRange.1 - resultRange.0 < i - 1 - startIdx {
                    resultRange.0 = startIdx
                    resultRange.1 = i - 1
                }
            }
            charDict[charAt] = i
            startIdx = max(repeatIdx + 1, startIdx)
        } else {
            charDict[charAt] = i
        }
    }
    return max(resultRange.1 - resultRange.0, charsCount - 1 - startIdx ) + 1
}
