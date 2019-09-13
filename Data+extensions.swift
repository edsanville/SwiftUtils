//
//  Data+extensions.swift
//  freshair-ios
//
//  Created by Edward Sanville on 8/15/19.
//  Copyright © 2019 Ballast Lane Developer. All rights reserved.
//

import Foundation

extension Data {
    
    static func withRandomBytes(_ count: Int) -> Data {
        var data = Data()
        
        for _ in 1...count {
            data.append(UInt8.random(in: UInt8.min...UInt8.max))
        }
        
        return data
    }
    
}
