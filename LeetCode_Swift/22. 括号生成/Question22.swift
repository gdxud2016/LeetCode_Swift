//
//  Question22.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/28.
//

import Foundation

//22. 括号生成
//数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
//示例 1：
//
//输入：n = 3
//输出：["((()))","(()())","(())()","()(())","()()()"]
//示例 2：
//
//输入：n = 1
//输出：["()"]

var resultArray = [String]()
func generateParenthesis(_ n: Int) -> [String]{
    if n == 1 { return ["()"]}
    appendParenthesis(currentStr: "(", currentIdx: 1, count: n, leftCount: 1, finish: 0)
    return resultArray;
}

func appendParenthesis(currentStr: String, currentIdx:Int, count: Int, leftCount: Int, finish: Int){
    let surplusCount = 2 * count - currentIdx;
    if (leftCount + finish >= count){
        let resultStr = currentStr + String(repeating: ")", count: surplusCount)
        resultArray.append(resultStr)
        return
    }
    if (leftCount < count){
        appendParenthesis(currentStr: "\(currentStr)(", currentIdx: currentIdx + 1, count: count, leftCount: leftCount + 1, finish: finish)
    }
    if (leftCount > 0){
        appendParenthesis(currentStr: "\(currentStr))", currentIdx: currentIdx + 1, count: count, leftCount: leftCount - 1, finish: finish + 1)
    }
}
