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

        for _ in 1...count {
            data.append(UInt8.random(in: UInt8.min...UInt8.max))
        }

        return data
    }

    func read<T>(offset: inout Int) -> T {
        let result: T = self.withUnsafeBytes {
            return $0.load(fromByteOffset: offset, as: T.self)
        }
        offset += MemoryLayout<T>.size
        return result
    }

    func readPascalString(offset: inout Int) -> String? {
        let count: UInt8 = self.read(offset: &offset)
        let stringBuffer = self.subdata(in: offset..<offset+Int(count))
        offset += (((Int(count) - 1 + 1) / 4 + 1) * 4 - 1) // Ridiculous, I know
        return String(data: stringBuffer, encoding: .utf8)
    }

}

