//
//  ViewController.swift
//  Test
//
//  Created by Edward Sanville on 9/30/19.
//  Copyright © 2019 Sanville Software. All rights reserved.
//

import UIKit

@objc
class ViewController: UIViewController {

    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        let f = MyNumberFormatter(significantDigits: 6)

//        for size in stride(from: 6, to: 36, by: 4) {
//            let attributes: [NSAttributedString.Key: Any] = [
//                .font: UIFont.systemFont(ofSize: CGFloat(size)),
//            ]
//
//            textView.print(f.attributedString(for: 1.2345678901e15, withDefaultAttributes: attributes)!)
//        }
//        
//        let attributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: 26),
//        ]
//        textView.print(f.attributedString(for: 1234567890, withDefaultAttributes: attributes)!)

        textView.print(f.attributedString(for: 12345678901.0, withDefaultAttributes: nil)!)

    }

}
