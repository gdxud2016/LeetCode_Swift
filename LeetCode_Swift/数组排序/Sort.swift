//
//  Sort.swift
//  leetcode
//
//  Created by xgd on 2022/3/21.
//

/// 排序算法
class Sort {
    
    /// 冒泡排序
    static func methon1<T: Comparable>(_ array: [T]) -> [T] {
        guard !array.isEmpty else { return array }
        
        var compareArr = array
        let count = compareArr.count
        for idx in 0 ..< count - 1 {
            for idx2 in 0 ..< (count - 1 - idx) {
                let value1 = compareArr[idx2]
                let value2 = compareArr[idx2 + 1]
                if value1 > value2 {
                    compareArr[idx2] = value2
                    compareArr[idx2 + 1] = value1
                }
            }
        }
        return compareArr
    }
    
    /// 选择排序
    static func methon2<T: Comparable>(_ array: [T]) -> [T] {
        guard !array.isEmpty else { return array }
        
        var compareArr = array
        let count = compareArr.count
        for idx in 0 ..< count - 1 {
            for idx2 in (idx + 1) ..< count {
                let value1 = compareArr[idx]
                let value2 = compareArr[idx2]
                if value1 > value2 {
                    let value3 = value1
                    compareArr[idx] = value2
                    compareArr[idx2] = value3
                }
            }
        }
        return compareArr
    }
    
    /// 插入排序
    static func methon3<T: Comparable>(_ array: [T]) -> [T] {
        guard !array.isEmpty else { return array }
        var sortArray = array
        let count = sortArray.count
        for idx in 1 ..< count {
            let value = sortArray[idx]
            var subIdx = idx - 1
            while subIdx >= 0 {
                if sortArray[subIdx] > value {
                    sortArray[subIdx + 1] = sortArray[subIdx]
                    subIdx -= 1
                } else {
                    break
                }
            }
            sortArray[subIdx + 1] = value
        }
        return sortArray
    }
    
    /// 希尔排序
    static func methon4<T: Comparable>(_ array: [T]) -> [T] {
        guard !array.isEmpty else { return array }
        var sortArray = array
        
        func sort(_ array: inout [T], step: Int) {
            guard step > 0 else { return }
            let endIdx = array.count - 1
            var startIdx = 0
            while startIdx + step <= endIdx {
                var compareIdx = endIdx
                while compareIdx >= step {
                    let stepIdx = compareIdx - step
                    if stepIdx < startIdx { break }
                    if array[stepIdx] > array[compareIdx] {
                        (array[stepIdx], array[compareIdx]) = (array[compareIdx], array[stepIdx])
                    }
                    compareIdx = stepIdx
                }
                startIdx += 1
            }
            sort(&array, step: step / 2)
        }
        sort(&sortArray, step: array.count/2)
        return sortArray
    }
    
    /// 归并排序
    static func methon5<T: Comparable>(_ array: [T]) -> [T] {
        guard !array.isEmpty else { return array }
        var sortArray = array
        
        func sort(array1: inout [T], startIdx: Int, endIdx: Int) -> [T] {
            guard startIdx >= 0, endIdx < array1.count, startIdx < endIdx else { return [array1[endIdx]] }
            let middleIdx = (startIdx + endIdx) / 2
            let leftArr = sort(array1: &array1, startIdx: startIdx, endIdx: middleIdx)
            let rightArr = sort(array1: &array1, startIdx: middleIdx + 1, endIdx: endIdx)
            var leftIdx: Int = 0
            var rightIdx: Int = 0
            let leftCount = leftArr.count
            let rightCount = rightArr.count
            var resultArr = Array<T>()
            while leftIdx < leftCount || rightIdx < rightCount {
                if leftIdx >= leftCount {
                    resultArr.append(rightArr[rightIdx])
                    rightIdx += 1
                    continue
                }
                
                if rightIdx >= rightCount {
                    resultArr.append(leftArr[leftIdx])
                    leftIdx += 1
                    continue
                }
                
                if leftArr[leftIdx] <= rightArr[rightIdx] {
                    resultArr.append(leftArr[leftIdx])
                    leftIdx += 1
                } else {
                    resultArr.append(rightArr[rightIdx])
                    rightIdx += 1
                }
            }
            return resultArr
        }
        return sort(array1: &sortArray, startIdx: 0, endIdx: sortArray.count - 1)
    }

    /// 快排
    static func methon6<T: Comparable>(_ array: [T]) -> [T] {
        guard !array.isEmpty else { return array }
        var sortArray = array
        
        func sort(array1: inout [T], startIdx: Int, endIdx: Int){
            guard startIdx >= 0, endIdx < array1.count, startIdx < endIdx else { return }
            var i = startIdx
            var j = endIdx
            let value = array1[startIdx]
            while i < j {
                while i < j {
                    if array1[j] <= value {
                        array1[i] = array1[j]
                        i += 1
                        break
                    }
                    j -= 1
                }
                
                while i < j {
                    if array1[i] > value {
                        array1[j] = array1[i]
                        j -= 1
                        break
                    }
                    i += 1
                }
            }
            array1[i] = value
            sort(array1: &array1, startIdx: startIdx, endIdx: i - 1)
            sort(array1: &array1, startIdx: i + 1, endIdx: endIdx)
        }
        sort(array1: &sortArray, startIdx: 0, endIdx: array.count - 1)
        return sortArray
    }

    /// 堆排序
    static func methon7<T: Comparable>(_ array: [T]) -> [T] {
        guard !array.isEmpty else { return array }
        var sortArray = array
        
        func createBiggesHeap(_ array1: inout [T], endIdx: Int) {
            guard endIdx >= 1 else { return }
            for idx in 1 ... endIdx {
                var currentIdx = idx
                while currentIdx > 0 {
                    let topIdx = (currentIdx - 1) / 2
                    if array1[currentIdx] > array1[topIdx] {
                        let value = array1[topIdx]
                        array1[topIdx] = array1[currentIdx]
                        array1[currentIdx] = value
                    }
                    currentIdx = topIdx
                }
            }
        }

        let count = sortArray.count
        for idx in 0 ..< count {
            createBiggesHeap(&sortArray, endIdx: count - 1 - idx)
            let value = sortArray[count - 1 - idx]
            sortArray[count - 1 - idx] = sortArray[0]
            sortArray[0] = value
        }
        return sortArray
    }

    /// 桶排序
    static func methon8(_ array: [Int]) -> [Int] {
        guard !array.isEmpty else { return array }
        var max: Int = Int.min
        for obj in array {
            if obj < 0 { return array }
            if obj > max { max = obj }
        }
        var sortArray:[[Int]?] = Array(repeating: nil, count: max + 1)
        for obj in array {
            var valueArray = sortArray[obj]
            if valueArray == nil {
                valueArray = Array<Int>()
            }
            valueArray?.append(obj)
            sortArray[obj] = valueArray
        }
        var resultArr = Array<Int>()
        for obj in sortArray {
            if let arr = obj { resultArr.append(contentsOf: arr )}
        }
        return resultArr
    }
    
}
