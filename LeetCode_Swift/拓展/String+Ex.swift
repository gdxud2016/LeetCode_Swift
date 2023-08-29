//
//  String+Ex.swift
//  XGDDemo_Leetcode
//
//  Created by xgd on 2023/8/15.
//

import Foundation

extension String{
    func characterAt(index: Int) -> Character? {
        if (index >= self.count || index < 0) { return nil }
        let i = self.index(self.startIndex, offsetBy: index)
        return self[i]
    }
    
    func substring(from: Int, to: Int) -> String?{
        let startIdx = self.index(self.startIndex, offsetBy: from)
        let endIdx = self.index(self.startIndex, offsetBy: to)
        let range = Range(uncheckedBounds: (lower: startIdx, upper: endIdx))
        return String(self[range])
    }
}
