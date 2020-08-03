//
//  UIViewController+alert.swift
//  freshair-ios
//
//  Created by Edward Sanville on 10/18/19.
//  Copyright © 2019 Ballast Lane Developer. All rights reserved.
//

import UIKit

extension UIViewController {

    func presentAlert(message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) {
            action in
            if let completion = completion {
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
        alert.addAction(action)

        self.present(alert, animated: true, completion: nil)
    }

    class func presentAlert(message: String, completion: (() -> Void)? = nil) {
        UIApplication.shared.keyWindow?.rootViewController?.presentAlert(message: message, completion: completion)
    }

}
