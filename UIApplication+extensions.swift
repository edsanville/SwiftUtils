//
//  UIApplication+extensions.swift
//  StarMap3DPlus
//
//  Created by Edward Sanville on 4/12/19.
//

import UIKit

@objc
extension UIApplication {
    
    static func appFullName() -> String {
        return Bundle.main.localizedInfoDictionary?["AppFullName"] as? String ?? (Bundle.main.infoDictionary!["AppFullName"] as? String)!
    }
    
    static func appName() -> String {
        return Bundle.main.localizedInfoDictionary?["CFBundleDisplayName"] as? String ?? (Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String)!
    }
    
    static func currentLanguage() -> String {
        return (UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray).firstObject as! String
    }
    
    static func appVersion() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? ""
    }

    static func appBuild() -> String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as? String ?? ""
    }
}
