//
//  Size.swift
//  StarMap3DPlus
//
//  Created by Edward Sanville on 5/17/20.
//

import Foundation

func sizeBytes<T>(_ x: T) -> Int {
    return MemoryLayout<T>.stride
}

func sizeBytes<T>(_ array: Array<T>) -> Int {
    array.count * MemoryLayout<T>.stride
}
