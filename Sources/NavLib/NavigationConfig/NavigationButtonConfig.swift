//
//  NavigationButtonConfig.swift
//  CustomNav
//
//  Created by lymanny on 1/2/25.
//

import UIKit

// MARK: - Navigation Button Configuration
public struct NavigationButtonConfig {
    public var titleConfig: ButtonTitleConfig? = nil // Title configuration
    public var image: UIImage? = nil // Button image
    public var frame: CGRect = CGRect(x: 0, y: 0, width: 24, height: 24) // Button frame
    public var selector: Selector? = nil // Button action selector

    // Public initializer
    public init(
        titleConfig: ButtonTitleConfig? = nil,
        image: UIImage? = nil,
        frame: CGRect = CGRect(x: 0, y: 0, width: 24, height: 24),
        selector: Selector? = nil
    ) {
        self.titleConfig = titleConfig
        self.image = image
        self.frame = frame
        self.selector = selector
    }
}

// MARK: - Button Title Configuration
public struct ButtonTitleConfig {
    public var title: String
    public var titleFontName: String = "System" // Title Font Name
    public var titleFontSize: CGFloat = 16 // Title Font Size
    public var titleFontWeight: UIFont.Weight = .medium // Title Font Weight
    public var titleColor: UIColor = .systemBlue // Title Text Color

    // Public initializer
    public init(
        title: String,
        titleFontName: String = "System",
        titleFontSize: CGFloat = 16,
        titleFontWeight: UIFont.Weight = .medium,
        titleColor: UIColor = .systemBlue
    ) {
        self.title = title
        self.titleFontName = titleFontName
        self.titleFontSize = titleFontSize
        self.titleFontWeight = titleFontWeight
        self.titleColor = titleColor
    }
}
