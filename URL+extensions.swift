//
//  URL+extensions.swift
//  mrLister
//
//  Created by Edward Sanville on 10/7/21.
//  Copyright © 2021 SanvilleSoftware. All rights reserved.
//

import Foundation

extension URL {

    static func documents(fileName: String) -> URL {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        return URL(fileURLWithPath: documentsDirectory, isDirectory: true).appendingPathComponent(fileName)
    }

    static func bundle(fileName: String) -> URL? {
        let body = (fileName as NSString).deletingPathExtension
        let ext = (fileName as NSString).pathExtension
        return Bundle.main.url(forResource: body, withExtension: ext)
    }

}
