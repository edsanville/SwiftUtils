//
//  UserDefaults+extensions.swift
//  freshair-vaping
//
//  Created by Edward Sanville on 2/2/22.
//  Copyright © 2022 FreshAir Sensor. All rights reserved.
//

import Foundation

extension UserDefaults {

    func bool(for key: String, default defaultValue: Bool) -> Bool {
        if let value = self.object(forKey: key) {
            return (value as? Bool) ?? defaultValue
        }
        else {
            return defaultValue
        }
    }
}
