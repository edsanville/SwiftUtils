//
//  Defaults.swift
//  starmap3d
//
//  Created by Edward Sanville on 11/15/20.
//

import Foundation

struct Defaults {

    static func integer(forKey key: String) -> Int? {
        if let r = UserDefaults.standard.object(forKey: key) as? NSNumber {
            return r.intValue
        }
        else {
            return nil
        }
    }

    static func bool(forKey key: String) -> Bool? {
        if let r = UserDefaults.standard.object(forKey: key) as? NSNumber {
            return r.boolValue
        }
        else {
            return nil
        }
    }

    static func int32(forKey key: String) -> Int32? {
        if let r = UserDefaults.standard.object(forKey: key) as? NSNumber {
            return r.int32Value
        }
        else {
            return nil
        }
    }

    static func uint32(forKey key: String) -> UInt32? {
        if let r = UserDefaults.standard.object(forKey: key) as? NSNumber {
            return r.uint32Value
        }
        else {
            return nil
        }
    }

    static func double(forKey key: String) -> Double? {
        if let r = UserDefaults.standard.object(forKey: key) as? NSNumber {
            return r.doubleValue
        }
        else {
            return nil
        }
    }

    static func float(forKey key: String) -> Float? {
        if let r = UserDefaults.standard.object(forKey: key) as? NSNumber {
            return r.floatValue
        }
        else {
            return nil
        }
    }

    static func string(for key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }

    static func set(_ value: Any?, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }

}
