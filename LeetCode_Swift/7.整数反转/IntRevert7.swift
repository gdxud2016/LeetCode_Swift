//
//  IntRevert7.swift
//  LeetCode_Swift
//
//  Created on 2025/8/16.
//

import Foundation

// 7. 整数反转
//
// 给你一个 32 位有符号整数 x ，返回将 x 中的数字部分反转后的结果。
// 如果反转后整数超过 32 位有符号整数的范围 [−2^31,  2^31 − 1] ，就返回 0。
// 假设环境不允许存储 64 位整数（有符号或无符号）。

func reverse(_ x: Int) -> Int {
    var num = x
    var reversed = 0
    
    while num != 0 {
        let digit = num % 10
        num /= 10
        
        // Check for overflow
        if reversed > Int32.max / 10 || (reversed == Int32.max / 10 && digit > 7) {
            return 0
        }
        if reversed < Int32.min / 10 || (reversed == Int32.min / 10 && digit < -8) {
            return 0
        }
        
        reversed = reversed * 10 + digit
    }
    
    return reversed
}
