//
//  Performance.swift
//  starmap3d
//
//  Created by Edward Sanville on 12/15/25.
//



/// Measures performance of code, and prints a little timing table.
struct Performance {
    let clock = ContinuousClock()

    struct Check {
        let name: String
        let instant: ContinuousClock.Instant
    }

    var checks: [Check] = []


    /// Call to start the performance-timed block.
    mutating func start() {
        self.checks = [Check(name: "Start", instant: self.clock.now)]
    }


    /// Add a checkpoint to the table.
    /// - Parameter name: User-defined name of this checkpoint.
    mutating func check(_ name: String = "") {
        self.checks.append(Check(name: name, instant: self.clock.now))
    }


    /// Print out the performance table.
    func report() {
        print("Performance")
        print("===========")

        var lastCheck: Check? = nil
        for check in self.checks {
            if let lastCheck = lastCheck {
                print("\(check.name.fixedWidth(20))  \(check.instant - lastCheck.instant)")
            }
            lastCheck = check
        }

        if let firstCheck = self.checks.first, let lastCheck = self.checks.last {
            print("Total: \(lastCheck.instant - firstCheck.instant)")
        }

    }
}

