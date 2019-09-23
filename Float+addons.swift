//
//  Float+addons.swift
//  StarMap3DPlus
//
//  Created by Edward Sanville on 9/7/19.
//

import Foundation

extension Float {
    
    static func from(stringOrNumber: Any?) -> Float? {
        
        if stringOrNumber == nil {
            return nil
        }
        
        if let s = stringOrNumber as? String {
            return Float(s)
        }

        if let f = stringOrNumber as? Float {
            return f
        }

        if let d = stringOrNumber as? Double {
            return Float(d)
        }

        return nil
    }
    
    func compare(other: Float) -> ComparisonResult {
        if self < other {
            return .orderedAscending
        }
        if self > other {
            return .orderedDescending
        }
        return .orderedSame
    }
    
}
