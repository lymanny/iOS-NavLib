//
//  NavigationSubtitleConfig.swift
//  CustomNav
//
//  Created by lymanny on 1/2/25.
//

import UIKit

// MARK: - Navigation Subtitle Configuration
public struct NavigationSubtitleConfig {
    public var subtitle: String
    public var subtitleFontName: String = "System" // Subtitle Font Name
    public var subtitleFontSize: CGFloat = 12 // Subtitle Font Size
    public var subtitleFontWeight: UIFont.Weight = .regular // Subtitle Font Weight
    public var subtitleColor: UIColor = .gray // Subtitle Color

    // Public initializer
    public init(
        subtitle: String,
        subtitleFontName: String = "System",
        subtitleFontSize: CGFloat = 12,
        subtitleFontWeight: UIFont.Weight = .regular,
        subtitleColor: UIColor = .gray
    ) {
        self.subtitle = subtitle
        self.subtitleFontName = subtitleFontName
        self.subtitleFontSize = subtitleFontSize
        self.subtitleFontWeight = subtitleFontWeight
        self.subtitleColor = subtitleColor
    }
}
