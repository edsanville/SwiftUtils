//
//  Double+addons.swift
//  StarMap3DPlus
//
//  Created by Edward Sanville on 9/9/19.
//

import Foundation

extension Double {
    
    static func from(stringOrNumber: Any?) -> Double? {
        
        if stringOrNumber == nil {
            return nil
        }
        
        if let s = stringOrNumber as? String {
            return Double(s)
        }
        
        if let d = stringOrNumber as? Double {
            return d
        }
        
        if let f = stringOrNumber as? Float {
            return Double(f)
        }
        
        return nil
    }
    
    func wrap(min: Double, max: Double) -> Double {
        return min + FMOD(self - min, max - min)
    }
    
}

func FMOD(_ x: Double, _ y: Double) -> Double {
    return x - floor(x / y) * y
}
