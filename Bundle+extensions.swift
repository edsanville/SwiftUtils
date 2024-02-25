//
//  NSBundle+extensions.swift
//  starmap3d
//
//  Created by Edward Sanville on 2/25/24.
//

import Foundation


extension Bundle {

    func string(forInfoDictionaryKey: String) -> String {
        return self.object(forInfoDictionaryKey: forInfoDictionaryKey) as? String ?? "Unknown"
    }

    func name() -> String {
        return self.string(forInfoDictionaryKey: "CFBundleName")
    }

    func version() -> String {
        return self.string(forInfoDictionaryKey: "CFBundleShortVersionString")
    }

    func build() -> String {
        return self.string(forInfoDictionaryKey: "CFBundleVersionString")
    }

}
