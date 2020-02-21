//
//  Plog.swift
//  OSA
//
//  Created by Edward Sanville on 7/24/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import Foundation

func plog(_ str: String, file_path: String = #file, line: Int = #line) {
    let file = URL(fileURLWithPath: file_path).lastPathComponent
    print("✅ \(file) (\(line)): \(str)")
}

func perr(_ str: String, file_path: String = #file, line: Int = #line) {
    let file = URL(fileURLWithPath: file_path).lastPathComponent
    print("🛑 \(file) (\(line)): \(str)")
}
