//
//  Question5.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//5. 最长回文子串
//
//给你一个字符串 s，找到 s 中最长的回文子串。
//如果字符串的反序与原始字符串相同，则该字符串称为回文字符串。

//// 最长回文字符串
func longestPalindrome(_ s: String) -> String {
    let arr = Array(s)
    let count = arr.count
    var resultRange = (0, 0)
    for i in 0 ..< count{
        let findRange = findLongestPalindrome(chars: arr, centerIdx: i)
        if (findRange.1 - findRange.0 > resultRange.1 - resultRange.0){
            resultRange = findRange
        }
    }
    return s.substring(from: resultRange.0, to: resultRange.1 + 1) ?? ""
}

// 通过操作字符数组查找最长回文字符串
func findLongestPalindrome(chars: [Character], centerIdx: Int) -> (Int, Int){
    let count = chars.count
    var startIdx = centerIdx
    var endIdx = centerIdx + 1
    while endIdx < count, startIdx >= 0, chars[startIdx] == chars[endIdx] {
        startIdx -= 1
        endIdx += 1
    }
    
    var resultRange = (startIdx + 1, endIdx - 1)
    startIdx = centerIdx - 1
    endIdx = centerIdx + 1
    while endIdx < count, startIdx >= 0, chars[startIdx] == chars[endIdx] {
        startIdx -= 1
        endIdx += 1
    }
    if (resultRange.1 - resultRange.0 + 1 < endIdx - startIdx - 1){
        resultRange.0 = startIdx + 1;
        resultRange.1 = endIdx - 1;
    }
    return resultRange
}

// 通过操作字符串查找最长回文字符串
func findLongestPalindrome1(str: String, centerIdx: Int) -> (Int, Int){
    var startIdx = centerIdx
    var endIdx = centerIdx + 1
    while let lc = str.characterAt(index: startIdx), let rc = str.characterAt(index: endIdx), lc == rc {
        startIdx -= 1
        endIdx += 1
    }
    
    var resultRange = (startIdx + 1, endIdx - 1)
    startIdx = centerIdx - 1
    endIdx = centerIdx + 1
    while let lc = str.characterAt(index: startIdx), let rc = str.characterAt(index: endIdx), lc == rc{
        startIdx -= 1
        endIdx += 1
    }
    if (resultRange.1 - resultRange.0 + 1 < endIdx - startIdx - 1){
        resultRange.0 = startIdx + 1;
        resultRange.1 = endIdx - 1;
    }
    return resultRange
}
