//
//  UIViewController+extensions.swift
//  freshair-vaping
//
//  Created by Edward Sanville on 2/2/22.
//  Copyright © 2022 FreshAir Sensor. All rights reserved.
//

import Foundation

extension UIViewController {

    func present(_ vc: UIViewController) {
        self.present(vc, animated: true, completion: nil)
    }

    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
