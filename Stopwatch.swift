//
//  RunTime.swift
//  starmap3d
//
//  Created by Edward Sanville on 11/17/23.
//

import Foundation

class Stopwatch {
    var startDate = Date()

    init() {
        pdebug("Stopwatch start")
    }

    func start() {
        // No-op, since it starts on init
        // This just exists to get lazy vars to init
    }

    func elapsed() -> TimeInterval {
        let now = Date()
        return now.timeIntervalSince(startDate)
    }
}
