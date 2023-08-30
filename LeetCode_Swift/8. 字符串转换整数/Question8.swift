//
//  Question8.swift
//  LeetCode_Swift
//
//  Created by xgd on 2023/8/29.
//

import Foundation

//8. 字符串转换整数 (atoi)
//
//请你来实现一个 myAtoi(string s) 函数，使其能将字符串转换成一个 32 位有符号整数（类似 C/C++ 中的 atoi 函数）。
//
//函数 myAtoi(string s) 的算法如下：
//
//读入字符串并丢弃无用的前导空格
//检查下一个字符（假设还未到字符末尾）为正还是负号，读取该字符（如果有）。 确定最终结果是负数还是正数。 如果两者都不存在，则假定结果为正。
//读入下一个字符，直到到达下一个非数字字符或到达输入的结尾。字符串的其余部分将被忽略。
//将前面步骤读入的这些数字转换为整数（即，"123" -> 123， "0032" -> 32）。如果没有读入数字，则整数为 0 。必要时更改符号（从步骤 2 开始）。
//如果整数数超过 32 位有符号整数范围 [−231,  231 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −231 的整数应该被固定为 −231 ，大于 231 − 1 的整数应该被固定为 231 − 1 。
//返回整数作为最终结果。



func myAtoi(_ s: String) -> Int {
    let count = s.count
    if count == 0 { return 0}
    let charsArr = Array(s)
    var minInt = -1
    for _ in 0 ..< 31{
        minInt *= 2
    }
    let maxInt = (minInt + 1) * (-1)
    let nextMaxInt = maxInt / 10
    let nextMinInt = minInt / 10
    
    var result = 0;
    // 符号，正负数
    var isNegativeNum = false
    var findNum = false
    for i in 0 ..< count{
        let char:Character = charsArr[i]
        
        if char.isNumber, let value = Int(String(char)){
            findNum = true
            // 保证result * 10 不会越界
            if result <= nextMaxInt, result >= nextMinInt{
                if isNegativeNum {
                    if result * 10 > minInt + value{ // 保证result * 10 + 当前值不会越界
                        result = result * 10 - value
                    } else {
                        return minInt
                    }
                } else{
                    if result * 10 < maxInt - value{ // 保证result * 10 + 当前值不会越界
                        result = result * 10 + value
                    } else {
                        return maxInt
                    }
                }
            } else {
                result = isNegativeNum ? minInt : maxInt
                break
            }
        }else {
            if findNum { return result }
            if char == "-" {
                isNegativeNum = true
                findNum = true
            } else if char == "+" {
                isNegativeNum = false
                findNum = true
            } else if char == " "{
            } else{
                 break
            }
        }
        
    }

    return result
}
