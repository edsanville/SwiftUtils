//
//  Data+hexadecimal.swift
//  FreshAir2
//
//  Created by Edward Sanville on 5/1/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import Foundation

extension Data {
    
    var hexadecimal: String {
        return map { String(format: "%02x", $0) }
            .joined()
    }
    
}
