//
//  NSAttributedString+extensions.swift
//  Test
//
//  Created by Edward Sanville on 9/30/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import Foundation

extension NSAttributedString {

    func appending(_ attributedString: NSAttributedString?) -> NSAttributedString {
        guard let attributedString = attributedString else {
            return self
        }

        if let s = self.mutableCopy() as? NSMutableAttributedString {
            s.append(attributedString)
            return s
        }
        else {
            return self
        }
    }

    func appending(_ string: String?) -> NSAttributedString {
        guard let string = string else {
            return self
        }

        if let mutableCopy = self.mutableCopy() as? NSMutableAttributedString {
            let index = self.length - 1
            if index >= 0 {
                let attributes = self.attributes(at: index, effectiveRange: nil)
                let attributedString = NSAttributedString(string: string, attributes: attributes)
                mutableCopy.append(attributedString)
                return mutableCopy
            }
            else {
                return self
            }
        }
        else {
            return self
        }

    }

    static func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        return lhs.appending(rhs)
    }

}
