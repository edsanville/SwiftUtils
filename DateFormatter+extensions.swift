//
//  DateFormatter+extensions.swift
//  freshair-ios
//
//  Created by Edward Sanville on 5/7/20.
//  Copyright © 2020 FreshAir Sensor. All rights reserved.
//

import Foundation

@objc
extension DateFormatter {
    class func isoFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter
    }

    static var medium: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .medium
        return f
    }()

}
