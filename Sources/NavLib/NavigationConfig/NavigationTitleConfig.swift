//
//  NavigationTitleConfig.swift
//  CustomNav
//
//  Created by lymanny on 1/2/25.
//

import UIKit

// MARK: - Navigation Title Configuration
public struct NavigationTitleConfig {
    var title: String
    var titleImage: UIImage? = nil // Dynamic Image Support
    var titleImageSize: CGSize = CGSize(width: 18, height: 16) // Title Image Size
    var titleFontName: String = "System" // Title Font Name
    var titleFontSize: CGFloat = 16 // Title Font Size
    var titleFontWeight: UIFont.Weight = .semibold // Title Font Weight
    var titleColor: UIColor = .black // Title Text Color
    var titleImageDirection: NSDirectionalRectEdge = .trailing // Image Title Direction
    var titleImagePadding: CGFloat = 4 // Spacing between the title text and the image in the button
    var titleSelector: Selector? = nil // Clickable Title Support
}

