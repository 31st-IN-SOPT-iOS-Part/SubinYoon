//
//  ColorLiterals.swift
//  IN-SOPT-Assignment
//
//  Created by devxsby on 2022/10/13.
//

import UIKit

extension UIColor {
    static var buttonYellow: UIColor {
        return UIColor(hex: "#FBE54C")
    }
    
    static var buttonGray: UIColor {
        return UIColor(hex: "#F6F6F6")
    }
    
    static var friendTabBackground: UIColor {
        return UIColor(hex: "#879198")
    }
    
    static var placeholerGray: UIColor {
        return UIColor(hex: "#A09FA0")
    }
    
    static var textGray: UIColor {
        return UIColor(hex: "#7D7E7D")
    }
    
    static var textDarkGray: UIColor {
        return UIColor(hex: "#313030")
    }
    
    static var lineDarkGray: UIColor {
        return UIColor(hex: "#9F9E9F")
    }
    
    static var lineLightGray: UIColor {
        return UIColor(hex: "#FA7AD")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
