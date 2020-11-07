//
//  NumberFormatter+extensions.swift
//  StarMap3DPlus
//
//  Created by Edward Sanville on 9/29/19.
//

import Foundation

@objc
extension NumberFormatter {

    convenience public init(decimalPlaces: Int) {
        self.init()

        self.locale = Locale.current
        self.numberStyle = .decimal
        self.maximumFractionDigits = decimalPlaces
        self.usesSignificantDigits = false
        self.usesGroupingSeparator = true
    }

    convenience public init(significantDigits: Int) {
        self.init()

        self.locale = Locale.current
        self.numberStyle = .decimal
        self.maximumSignificantDigits = significantDigits
        self.usesSignificantDigits = true
        self.usesGroupingSeparator = true
    }

}
