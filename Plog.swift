//
//  Plog.swift
//  OSA
//
//  Created by Edward Sanville on 7/24/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import Foundation

let checkmark = "✅"
let info = "ℹ️"
let warning = "⚠️"
let error = "🛑"

@objcMembers
final class Plog: NSObject {

    static var saveLogs = false
    private static var log = ""
    private static let lock = NSLock()

    private static func append(line: String) {
        lock.lock()
        log.append(line + "\n")
        lock.unlock()
    }

    class func string() -> String {
        return log
    }

    class func data() -> Data {
        return log.data(using: .utf8) ?? "Couldn't encode plog to utf8!".data(using: .utf8)!
    }

    class func clear() {
        lock.lock()
        log = ""
        lock.unlock()
    }

    class func plog(prefix: String, str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
        let file = URL(fileURLWithPath: file_path).lastPathComponent
        let line = "\(prefix) \(file) (\(line)): \(str ?? "nil")"
        print(line)

        if Plog.saveLogs {
            Plog.append(line: line)
        }
    }

}

func plog(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    Plog.plog(prefix: info, str: str, file_path: file_path, line: line)
}

func psuccess(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    Plog.plog(prefix: checkmark, str: str, file_path: file_path, line: line)
}

func pwarn(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    Plog.plog(prefix: warning, str: str, file_path: file_path, line: line)
}

func perr(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    Plog.plog(prefix: error, str: str, file_path: file_path, line: line)
}
