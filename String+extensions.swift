//
//  String+extensions.swift
//  StarMap3DPlus
//
//  Created by Edward Sanville on 10/21/19.
//

import Foundation

extension String {

    subscript(_ i: Int) -> String {
        let idx1 = index(startIndex, offsetBy: i)
        let idx2 = index(idx1, offsetBy: 1)
        return String(self[idx1..<idx2])
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start ..< end])
    }

    subscript (r: CountableClosedRange<Int>) -> String {
        let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
        let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[startIndex...endIndex])
    }


    /// Pads or crops a string to a certain character width.
    /// - Parameters:
    ///   - length: Desired width, in characters.
    ///   - pad: Padding character.
    /// - Returns: The padded string.
    func fixedWidth(_ length: Int, pad: Character=" ") -> String {
        if self.count > length {
            return String(self.prefix(length))
        } else {
            return self.padding(toLength: length, withPad: String(pad), startingAt: 0)
        }
    }

}
