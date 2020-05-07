//
//  Plog.swift
//  OSA
//
//  Created by Edward Sanville on 7/24/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import Foundation

@objcMembers
final class Plog: NSObject {

    static var saveLogs = true
    private static var log = ""

    class func append(line: String) {
        log.append(line + "\n")
    }

    class func string() -> String {
        return log
    }

    class func data() -> Data {
        return log.data(using: .utf8) ?? "Couldn't encode plog to utf8!".data(using: .utf8)!
    }

    class func clear() {
        log = ""
    }

    class func plog(_ str: CustomStringConvertible, file_path: String = #file, line: Int = #line) {
        let file = URL(fileURLWithPath: file_path).lastPathComponent
        let line = "✅ \(file) (\(line)): \(str)"
        print(line)

        if Plog.saveLogs {
            Plog.append(line: line)
        }
    }

    class func perr(_ str: CustomStringConvertible, file_path: String = #file, line: Int = #line) {
        let file = URL(fileURLWithPath: file_path).lastPathComponent
        let line = "🛑 \(file) (\(line)): \(str)"
        print(line)

        if Plog.saveLogs {
            Plog.append(line: line)
        }
    }

}

func plog(_ str: CustomStringConvertible, file_path: String = #file, line: Int = #line) {
    Plog.plog(str, file_path: file_path, line: line)
}

func perr(_ str: CustomStringConvertible, file_path: String = #file, line: Int = #line) {
    Plog.perr(str, file_path: file_path, line: line)
}
