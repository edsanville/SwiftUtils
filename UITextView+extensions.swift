//
//  UITextView+extensions.swift
//  Test
//
//  Created by Edward Sanville on 9/30/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import UIKit

extension UITextView {

    func append(_ string: String?) {
        guard let string = string else {
            return
        }

        if self.attributedText != nil {
            self.attributedText = self.attributedText.appending(string)
        }
        else {
            self.text = self.text.appending(string)
        }

    }

    func append(_ attributedString: NSAttributedString?) {
        guard let attributedString = attributedString else {
            return
        }

        self.attributedText = self.attributedText.appending(attributedString)
    }

    func print(_ string:String) {
        self.append(string + "\n")
    }

    func print(_ attributedString: NSAttributedString) {
        self.append(attributedString)
        self.append("\n")
    }

}
