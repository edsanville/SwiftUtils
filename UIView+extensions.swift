//
//  UIView+extensions.swift
//  StarMap3DPlus
//
//  Created by Edward Sanville on 9/29/19.
//

import UIKit

@IBDesignable extension UIView {

    @IBInspectable var borderColor: UIColor? {
        set(color) {
            self.layer.borderColor = color?.cgColor
        }
        get {
            if let c = self.layer.borderColor {
                return UIColor(cgColor: c)
            }
            else {
                return nil
            }
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(w) {
            layer.borderWidth = w
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(r) {
            layer.cornerRadius = r
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set(r) {
            layer.shadowOpacity = r
        }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set(r) {
            layer.shadowRadius = r
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set(r) {
            layer.shadowOffset = r
        }
    }

}
