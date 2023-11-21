//
//  Logger.swift
//
//  Created by Edward Sanville on 7/24/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import Foundation


enum LogLevel: Comparable {
    case debug
    case info
    case success
    case warning
    case error

    var prefix: String {
        switch self {
        case .debug:
            return "📄 [debug] "
        case .info:
            return "ℹ️"
        case .success:
            return "✅"
        case .warning:
            return "⚠️"
        case .error:
            return "🛑"
        }
    }
}


@objcMembers
final class Logger: NSObject {

    var level: LogLevel

    init(level: LogLevel = .info) {
        self.level = level
        super.init()
    }

    func log(level: LogLevel, str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
        if level < self.level {
            return
        }

        let file = URL(fileURLWithPath: file_path).lastPathComponent

        // We want each line of the str on a different line, all with the same prefix
        let strLines = str?.description.split(separator: "\n") ?? ["nil"]

        for strLine in strLines {
            let line = "\(level.prefix) \(file) (\(line)): \(strLine)"
            print(line)
        }
    }


    func debug(str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
        #if DEVELOPMENT
        self.log(level: .debug, str: str)
        #endif
    }

    func info(str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
        self.log(level: .info, str: str)
    }

    func success(str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
        self.log(level: .success, str: str)
    }

    func warning(str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
        self.log(level: .warning, str: str)
    }

    func error(str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
        self.log(level: .error, str: str)
    }

}


let logger = Logger()


func plog(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    logger.log(level: .info, str: str, file_path: file_path, line: line)
}

func psuccess(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    logger.log(level: .success, str: str, file_path: file_path, line: line)
}

func pwarn(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    logger.log(level: .warning, str: str, file_path: file_path, line: line)
}

func perr(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    logger.log(level: .error, str: str, file_path: file_path, line: line)
}

func pdebug(_ str: CustomStringConvertible?, file_path: String = #file, line: Int = #line) {
    logger.debug(str: str, file_path: file_path, line: line)
}
