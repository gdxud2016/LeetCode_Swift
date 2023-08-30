//
//  Question12.swift
//  LeetCode_Swift
//
//  Created by xgd on 2023/8/29.
//

import Foundation


//12. 整数转罗马数字
//罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。
//
//字符          数值
//I             1
//V             5
//X             10
//L             50
//C             100
//D             500
//M             1000
//例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
//
//通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
//
//I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
//X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
//C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
//给你一个整数，将其转为罗马数字。


func intToRoman(_ num: Int) -> String {

    let referenceTable = [
        "M",
        "CM",
        "D",
        "CD",
        "C",
        "XC",
        "L",
        "XL",
        "X",
        "IX",
        "V",
        "IV",
        "I"]
    let referenceTable2 = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    var result: String = ""
    var iteratorNum:Int = num
    let count = referenceTable2.count
    for i in 0 ..< count {
        let value: Int = referenceTable2[i]
        let repeates = iteratorNum / value
        if repeates > 0 {
            result.append(String(repeating: referenceTable[i], count: repeates))
            iteratorNum = iteratorNum % value
            if iteratorNum == 0 { break }
        }
    }
    return result
}

func intToRoman1(_ num: Int) -> String {
    var result = ""
    var iteratorNum:Int = num
    if iteratorNum >= 1000 {
        result.append(String(repeating: "M", count: iteratorNum / 1000))
        iteratorNum = iteratorNum % 1000
    }
    if iteratorNum >= 900 {
        result.append("CM")
        iteratorNum = iteratorNum % 900
    }
    if iteratorNum >= 500 {
        result.append("D")
        iteratorNum = iteratorNum % 500
    }
    if iteratorNum >= 400 {
        result.append("CD")
        iteratorNum = iteratorNum % 400
    }
    if iteratorNum >= 100 {
        result.append(String(repeating: "C", count: iteratorNum / 100))
        iteratorNum = iteratorNum % 100
    }
    if iteratorNum >= 90 {
        result.append("XC")
        iteratorNum = iteratorNum % 90
    }
    if iteratorNum >= 50 {
        result.append("L")
        iteratorNum = iteratorNum % 50
    }
    if iteratorNum >= 40 {
        result.append("XL")
        iteratorNum = iteratorNum % 40
    }
    if iteratorNum >= 10 {
        result.append(String(repeating: "X", count: iteratorNum / 10))
        iteratorNum = iteratorNum % 10
    }
    if iteratorNum == 9 {
        result.append("IX")
        return result
    }
    if iteratorNum >= 5 {
        result.append("V")
        iteratorNum = iteratorNum % 5
    }
    if iteratorNum >= 4 {
        result.append("IV")
        return result
    }
    if iteratorNum > 0 {
        result.append(String(repeating: "I", count: iteratorNum))
    }
    return result
}
