//
//  Question6.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//6. N 字形变换
//将一个给定字符串 s 根据给定的行数 numRows ，以从上往下、从左到右进行 Z 字形排列。
//比如输入字符串为 "PAYPALISHIRING" 行数为 3 时，排列如下：
//
//P   A   H   N
//A P L S I I G
//Y   I   R
//之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："PAHNAPLSIIGYIR"。
//
//请你实现这个将字符串进行指定行数变换的函数：

func convert(_ s: String, _ numRows: Int) -> String {
    let count = s.count
    if count <= numRows || numRows == 1 { return s}
    let charactersArr:[Character] = Array(s)
    var resultArr:[Character] = Array()
    let vertexOffset = 2 * (numRows - 1)
    for i in 0 ..< numRows{
        var offsetIdx = 0
        while true {
            if i == 0 || i == numRows - 1{
                if (offsetIdx + i < count) {
                    resultArr.append(charactersArr[offsetIdx + i])
                } else {
                    break
                }
            } else {
                if (offsetIdx - i >= 0 && offsetIdx - i < count) {
                    resultArr.append(charactersArr[offsetIdx - i])
                }
                if (offsetIdx + i < count){
                    resultArr.append(charactersArr[offsetIdx + i])
                } else {
                    break
                }
            }
            offsetIdx += vertexOffset
        }
    }
    return String(resultArr)
}
