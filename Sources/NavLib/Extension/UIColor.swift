//
//  UIColor.swift
//  CustomNav
//
//  Created by lymanny on 31/1/25.
//

import UIKit

public extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1) {
        // Trim whitespace and newlines
        let trimmedString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: trimmedString)
        
        // Skip the "#" prefix if it exists
        if trimmedString.hasPrefix("#") {
            scanner.currentIndex = trimmedString.index(after: trimmedString.startIndex)
        }
        
        var color: UInt64 = 0
        // Scan the hexadecimal value into a UInt64
        if scanner.scanHexInt64(&color) {
            let mask = 0x000000FF
            let r = Int((color >> 16) & UInt64(mask))
            let g = Int((color >> 8) & UInt64(mask))
            let b = Int(color & UInt64(mask))
            
            // Normalize RGB values to [0, 1] range
            let red = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue = CGFloat(b) / 255.0
            
            // Initialize UIColor with normalized RGB and alpha
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            // If scanning fails, initialize to clear color
            self.init(white: 0, alpha: 0)
        }
    }
    
    public convenience init(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
        // Ensure RGB values are in valid range
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        // Ensure transparency is clamped between 0 and 1
        let clampedTransparency = min(max(transparency, 0), 1)
        
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: clampedTransparency
        )
    }
}
