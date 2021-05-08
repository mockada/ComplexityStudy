//
//  ViewController.swift
//  ComplexityStudy
//
//  Created by Jade Silveira on 08/05/21.
//

import UIKit

class ViewController: UIViewController {
    let numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450]

    override func viewDidLoad() {
        super.viewDidLoad()
        let result = binarySearch(array: [], value: 23)
        print(result)
    }

    func naiveContains(_ value: Int, in array: [Int]) -> Bool {
        guard !array.isEmpty else { return false }
        let middleIndex = array.count / 2
        
        switch value {
        case array[middleIndex], array[array.endIndex]:
            return true
        case value..<array[middleIndex]:
            return verifyIndex(startIndex: 0, endIndex: middleIndex, array: array, value: value)
        default:
            return verifyIndex(startIndex: middleIndex, endIndex: array.count, array: array, value: value)
        }
    }
    
    func verifyIndex(startIndex: Int, endIndex: Int, array: [Int], value: Int) -> Bool {
        for index in startIndex..<endIndex {
            if array[index] == value {
                return true
            }
        }
        return false
    }
    
    func binarySearch(array: [Int], value: Int) -> Bool {
        if array.count <= 1 { return array.first == value }
        let middleIndex = array.count / 2
        
        if array[middleIndex] == value { return true }
        if value > array[middleIndex] {
            return binarySearch(array: Array(array[middleIndex..<array.count]), value: value)
        }
        if value < array[middleIndex] {
            return binarySearch(array: Array(array[0..<middleIndex]), value: value)
        }
        return false
    }
}

