//
//  NavigationButtonConfig.swift
//  CustomNav
//
//  Created by lymanny on 1/2/25.
//

import UIKit

// MARK: - Navigation Button Configuration
public struct NavigationButtonConfig {
    var titleConfig: ButtonTitleConfig? = nil // Title configuration
    var image: UIImage? = nil // Button image
    var frame: CGRect = CGRect(x: 0, y: 0, width: 24, height: 24) // Button frame
    var selector: Selector? = nil // Button action selector
}


public struct ButtonTitleConfig {
    var title: String
    var titleFontName: String = "System" // Title Font Name
    var titleFontSize: CGFloat = 16 // Title Font Size
    var titleFontWeight: UIFont.Weight = .medium // Title Font Weight
    var titleColor: UIColor = .systemBlue // Title Text Color
    
}


