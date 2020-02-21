//
//  Data+extensions.swift
//  freshair-ios
//
//  Created by Edward Sanville on 8/15/19.
//  Copyright © 2019 Ballast Lane Developer. All rights reserved.
//

import Foundation

extension Foundation.Data {

    static func withRandomBytes(_ count: Int) -> Foundation.Data {
        var data = Foundation.Data()

        for _ in 0..<count {
            data.append(UInt8.random(in: UInt8.min...UInt8.max))
        }

        return data
    }

    static func randomAuthKey() -> Foundation.Data {
        let byte_palette = (UInt8.min...UInt8.max).compactMap {
            val in
            return (val == 0x00 || val == 0x0a) ? nil : val
        }

        var bytes: [UInt8] = []

        for _ in 0..<16 {
            bytes.append(byte_palette.randomElement()!)
        }
        return Data(bytes)
    }

}
