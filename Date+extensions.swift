//
//  Date+extensions.swift
//  mrLister
//
//  Created by Edward Sanville on 10/5/21.
//  Copyright © 2021 SanvilleSoftware. All rights reserved.
//

import Foundation

extension Date {

    init?(httpDateString s: String?) {
        guard let s = s else { return nil }
        guard let d = DateFormatter.httpDateFormatter.date(from: s) else { return nil }
        self = d
    }

    init?(isoString s: String?) {
        guard let s = s else { return nil }
        guard let d = DateFormatter.isoFormatter().date(from: s) else { return nil }
        self = d
    }

    var isoString: String {
        return DateFormatter.isoFormatter().string(from: self)
    }

}
