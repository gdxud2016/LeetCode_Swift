//
//  String+Extension.swift
//  leetcode
//
//  Created by xgd on 2022/3/23.
//

import Foundation

extension String {
    func removeLastZero() -> String {
        guard self.contains("."), self.hasSuffix("0") else { return self }
        let str1 = self.replaceString(pattern: "0+$", with: "")
        let str2 = str1.replaceString(pattern: "\\.0*$", with: "")
        return str2
    }
    
    func replaceString(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        do {
            let regular = try NSRegularExpression(pattern: pattern, options: options)
            return regular.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: with)
        } catch let error {
            debugPrint(error)
            return self
        }
    }
}

extension Double{
    func formateSelfUnit(bit: Int) -> String {
        guard bit >= 0 else { return "\(Int(self)) " }
        if self >= 100000000 {
            var result = NSString(format: "%.\(bit)f" as NSString, self / 100000000) as String
            result = result.removeLastZero()
            return "\(result) 亿"
        } else if self >= 10000 {
            var result = NSString(format: "%.\(bit)f" as NSString, self / 10000) as String
            result = result.removeLastZero()
            return "\(result) 万"
        } else {
            return "\(Int(self)) "
        }
    }
}
