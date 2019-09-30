//
//  MyNumberFormatter.swift
//  Test
//
//  Created by Edward Sanville on 9/30/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import UIKit

@objc
protocol Translator {
    func translation(of: String?) -> String?
}

@objcMembers
class MyNumberFormatter: NumberFormatter {

    var scientificNotationThreshold = 1e13
    var wordyThreshold = 1e6
    static var translate = {
        (s: String) -> String in
        return Bundle.main.localizedString(forKey: s, value: s, table: "SwiftUtils")
    }
    static let timesSymbol = "⨉"

    // MARK: Strings

    override func string(for d: Any?) -> String? {
        switch d {
        case let d as Double:
            return string(for: d)
        case let f as Float:
            return string(for: Double(f))
        default:
            return nil
        }
    }

    private final func string(for d: Double) -> String? {
        if abs(d) >= scientificNotationThreshold {
            return scientificNotationString(double: d)
        }
        if abs(d) >= wordyThreshold {
            return wordyString(double: d)
        }
        
        return super.string(for: d)
    }

    private func scientificNotationString(double: Double) -> String? {
        let ex = Int(floor(log10(abs(double))))
        let coeff = double / pow(10.0, Double(ex))
        let s = "\(super.string(for: coeff) ?? "-") \(MyNumberFormatter.timesSymbol) 10^\(ex)"
        return s
    }

    private func wordyString(double: Double) -> String {
        let wordDict = [
            1e6: "million",
            1e9: "billion",
            1e12: "trillion"
        ]
        
        for thresh in wordDict.keys.sorted().reversed() {
            if abs(double) > thresh {
                let number = double / thresh
                let numberString = super.string(for: number) ?? "-"
                let illionString = wordDict[thresh]!
                
                let localizedIllionString = MyNumberFormatter.translate(illionString)
                
                return numberString + " " + localizedIllionString
            }
        }
        return super.string(for: double) ?? "-"
    }
    
    // MARK: AttributedStrings

    override func attributedString(for obj: Any, withDefaultAttributes attrs: [NSAttributedString.Key : Any]? = nil) -> NSAttributedString? {
        switch obj {
        case let d as Double:
            return attributedString(for: d, withDefaultAttributes: attrs)
        case let f as Float:
            return attributedString(for: Double(f), withDefaultAttributes: attrs)
        default:
            return nil
        }
    }

    private final func attributedString(for d: Double, withDefaultAttributes attrs: [NSAttributedString.Key : Any]? = nil) -> NSAttributedString? {
        if abs(d) >= scientificNotationThreshold {
            return scientificNotationAttributedString(double: d, withDefaultAttributes: attrs)
        }
        if abs(d) >= wordyThreshold {
            return NSAttributedString(string: wordyString(double: d), attributes: attrs)
        }
        return NSAttributedString(string: super.string(for: d) ?? "-")
    }

    private func scientificNotationAttributedString(double: Double, withDefaultAttributes attrs: [NSAttributedString.Key : Any]? = nil) -> NSAttributedString? {
        let ex = Int(floor(log10(abs(double))))
        let coeff = double / pow(10.0, Double(ex))
        let exString = super.string(for: ex) ?? "-"

        let attributedString = NSMutableAttributedString(string: "\(super.string(for: coeff) ?? "-") \(MyNumberFormatter.timesSymbol) 10", attributes: attrs)

        var attributes = attrs ?? [:]
        let defaultFont = attributes[.font] as? UIFont ?? UIFont.systemFont(ofSize: 12)

        // Setup subscript for scientific notation
        let subscriptFont = UIFont(descriptor: defaultFont.fontDescriptor, size: defaultFont.pointSize / 2.0)
        attributes[.baselineOffset] = defaultFont.pointSize / 2.0
        attributes[.font] = subscriptFont

        attributedString.append(NSAttributedString(string: exString, attributes: attributes))
        return attributedString
    }

}
