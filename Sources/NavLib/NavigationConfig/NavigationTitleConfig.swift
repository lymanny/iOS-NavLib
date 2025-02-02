//
//  NavigationTitleConfig.swift
//  CustomNav
//
//  Created by lymanny on 1/2/25.
//

import UIKit

// MARK: - Navigation Title Configuration
public struct NavigationTitleConfig {
    public var title: String
    public var titleImage: UIImage? = nil // Dynamic Image Support
    public var titleImageSize: CGSize = CGSize(width: 18, height: 16) // Title Image Size
    public var titleFontName: String = "System" // Title Font Name
    public var titleFontSize: CGFloat = 16 // Title Font Size
    public var titleFontWeight: UIFont.Weight = .semibold // Title Font Weight
    public var titleColor: UIColor = .black // Title Text Color
    public var titleImageDirection: NSDirectionalRectEdge = .trailing // Image Title Direction
    public var titleImagePadding: CGFloat = 4 // Spacing between the title text and the image in the button
    public var titleSelector: Selector? = nil // Clickable Title Support

    // Public initializer
    public init(
        title: String,
        titleImage: UIImage? = nil,
        titleImageSize: CGSize = CGSize(width: 18, height: 16),
        titleFontName: String = "System",
        titleFontSize: CGFloat = 16,
        titleFontWeight: UIFont.Weight = .semibold,
        titleColor: UIColor = .black,
        titleImageDirection: NSDirectionalRectEdge = .trailing,
        titleImagePadding: CGFloat = 4,
        titleSelector: Selector? = nil
    ) {
        self.title = title
        self.titleImage = titleImage
        self.titleImageSize = titleImageSize
        self.titleFontName = titleFontName
        self.titleFontSize = titleFontSize
        self.titleFontWeight = titleFontWeight
        self.titleColor = titleColor
        self.titleImageDirection = titleImageDirection
        self.titleImagePadding = titleImagePadding
        self.titleSelector = titleSelector
    }
}
