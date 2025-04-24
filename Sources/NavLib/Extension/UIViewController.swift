//
//  UIViewController.swift
//  CustomNav
//
//  Created by lymanny on 31/1/25.
//

import UIKit

public extension UIViewController {
    
    // MARK: - Navigation Bar Customization
    func setNavigationBarStyleWeBill(
        isHidden: Bool, // Hides or shows the navigation bar
        barTintColor: UIColor = UIColor.white, // Background color of the navigation bar
        titleConfig: NavigationTitleConfig, // 🔹 Title Configuration
        subtitleConfig: NavigationSubtitleConfig? = nil, // 🔹 Subtitle Configuration (Optional)
        leftButtons: [NavigationButtonConfig] = [], // 🔹 Left Button Configurations
        rightButtons: [NavigationButtonConfig] = [], // 🔹 Right Button Configurations
        titleSubtitleSpacing: CGFloat = 2, // 🔹 Spacing Between Title & Subtitle
        btnLeftRightSpacing: CGFloat = 20 // 🔹 Spacing for Left & Right Buttons
    ) {
        guard let navController = navigationController else { return }
        
        // Configure the navigation bar appearance (iOS 13+)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = barTintColor
            appearance.shadowColor = .clear
            
            let titleFont = UIFont(name: titleConfig.titleFontName, size: titleConfig.titleFontSize) ??
            UIFont.systemFont(ofSize: titleConfig.titleFontSize, weight: titleConfig.titleFontWeight)
            
            appearance.titleTextAttributes = [
                .foregroundColor: titleConfig.titleColor,
                .font: titleFont
            ]
            
            navController.navigationBar.standardAppearance = appearance
            navController.navigationBar.scrollEdgeAppearance = appearance
        }
        
        // Apply navigation bar properties
        navController.setNavigationBarHidden(isHidden, animated: true)
        navController.navigationBar.barTintColor = barTintColor
        navController.navigationBar.tintColor = titleConfig.titleColor
        
        // Set up title and subtitle stack view
        self.navigationItem.titleView = createTitleStackView(titleConfig: titleConfig, subtitleConfig: subtitleConfig, titleSubtitleSpacing: titleSubtitleSpacing)
        
        // Set up left and right navigation buttons
        self.navigationItem.leftBarButtonItems = createNavigationBarButtons(leftButtons, spacing: btnLeftRightSpacing)
        self.navigationItem.rightBarButtonItems = createNavigationBarButtons(rightButtons, spacing: btnLeftRightSpacing)
    }
    
    // MARK: - Create Title View
    func createTitleStackView(titleConfig: NavigationTitleConfig, subtitleConfig: NavigationSubtitleConfig?, titleSubtitleSpacing: CGFloat) -> UIView {
        let titleStackView = UIStackView()
        titleStackView.axis = .vertical
        titleStackView.alignment = .center
        titleStackView.spacing = titleSubtitleSpacing
        
        // Create Title Button
        let titleButton = UIButton()
        
        if #available(iOS 15.0, *) {
            // Properly apply custom font using NSAttributedString (better Khmer rendering)
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: titleConfig.titleFontName, size: titleConfig.titleFontSize)
                ?? UIFont.systemFont(ofSize: titleConfig.titleFontSize, weight: titleConfig.titleFontWeight),
                .foregroundColor: titleConfig.titleColor
            ]
            let attributedTitle = NSAttributedString(string: titleConfig.title, attributes: attributes)
            titleButton.setAttributedTitle(attributedTitle, for: .normal)
            titleButton.titleLabel?.numberOfLines = 0
            titleButton.titleLabel?.textAlignment = .center
            
            if let image = titleConfig.titleImage {
                titleButton.setImage(image.resized(to: titleConfig.titleImageSize), for: .normal)
                titleButton.semanticContentAttribute = titleConfig.titleImageDirection == .leading ? .forceLeftToRight : .forceRightToLeft
                titleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: titleConfig.titleImagePadding, bottom: 0, right: 0)
            }
        } else {
            // Fallback for iOS 14 and earlier (supports iOS 13+)
            titleButton.setTitle(titleConfig.title, for: .normal)
            titleButton.setTitleColor(titleConfig.titleColor, for: .normal)
            titleButton.titleLabel?.font = UIFont(name: titleConfig.titleFontName, size: titleConfig.titleFontSize)
            ?? UIFont.systemFont(ofSize: titleConfig.titleFontSize, weight: titleConfig.titleFontWeight)
            
            if let image = titleConfig.titleImage {
                let resizedImage = image.resized(to: titleConfig.titleImageSize)
                titleButton.setImage(resizedImage, for: .normal)
                titleButton.semanticContentAttribute = titleConfig.titleImageDirection == .leading ? .forceLeftToRight : .forceRightToLeft
                titleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: titleConfig.titleImagePadding, bottom: 0, right: 0)
            }
        }
        
        if let selector = titleConfig.titleSelector {
            titleButton.addTarget(self, action: selector, for: .touchUpInside)
        }
        
        titleStackView.addArrangedSubview(titleButton)
        
        // Add subtitle if available
        if let subtitleConfig = subtitleConfig {
            let subtitleLabel = UILabel()
            subtitleLabel.text = subtitleConfig.subtitle
            subtitleLabel.font = UIFont(name: subtitleConfig.subtitleFontName, size: subtitleConfig.subtitleFontSize) ??
            UIFont.systemFont(ofSize: subtitleConfig.subtitleFontSize, weight: subtitleConfig.subtitleFontWeight)
            subtitleLabel.textColor = subtitleConfig.subtitleColor
            subtitleLabel.textAlignment = .center
            
            subtitleLabel.numberOfLines = 0
            subtitleLabel.lineBreakMode = .byWordWrapping
            subtitleLabel.setContentHuggingPriority(.required, for: .vertical)
            subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
            
            titleStackView.addArrangedSubview(subtitleLabel)
        }
        
        // Wrap the stack view in a container view to fix layout issues on devices like iPhone X
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(titleStackView)
        
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            titleStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // Optional: Prevent layout overflow on smaller screens
            containerView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width - 120)
        ])
        
        return containerView
    }
    
    // MARK: - Create Navigation Buttons with Spacing
    func createNavigationBarButtons(_ buttons: [NavigationButtonConfig], spacing: CGFloat) -> [UIBarButtonItem] {
        var barButtonItems: [UIBarButtonItem] = []
        
        for (index, buttonConfig) in buttons.enumerated() {
            let button = createButton(from: buttonConfig)
            let barButtonItem = UIBarButtonItem(customView: button)
            barButtonItems.append(barButtonItem)
            
            // Add spacing except for the last button
            if index < buttons.count - 1 {
                let spacingItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                spacingItem.width = spacing
                barButtonItems.append(spacingItem)
            }
        }
        
        return barButtonItems
    }
    
    // MARK: - Create Individual Button
    func createButton(from config: NavigationButtonConfig) -> UIButton {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false // Ensure constraints work properly
        
        // Handle title configuration
        if let titleConfig = config.titleConfig {
            button.setTitle(titleConfig.title, for: .normal)
            button.setTitleColor(titleConfig.titleColor, for: .normal)
            button.titleLabel?.font = UIFont(
                name: titleConfig.titleFontName,
                size: titleConfig.titleFontSize
            ) ?? UIFont.systemFont(ofSize: titleConfig.titleFontSize, weight: titleConfig.titleFontWeight)
            
            // Apply constraints for title
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(greaterThanOrEqualToConstant: 60), // Minimum width for title
                button.heightAnchor.constraint(equalToConstant: config.frame.height)
            ])
        }
        
        // Handle image configuration
        if let image = config.image {
            let resizedImage = image.resized(to: CGSize(width: config.frame.width, height: config.frame.height))
            button.setImage(resizedImage, for: .normal)
            button.imageView?.contentMode = config.imageContentMode
            
            // Apply constraints for image
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: config.frame.width),
                button.heightAnchor.constraint(equalToConstant: config.frame.height)
            ])
        }
        
        // Add action if a selector is provided
        if let selector = config.selector {
            button.addTarget(self, action: selector, for: .touchUpInside)
        }
        
        return button
    }
    
    
    // MARK: - Button Animation
    func animateButton(_ button: UIButton, completion: @escaping () -> Void = {}) {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction], animations: {
            button.transform = CGAffineTransform(scaleX: 0.85, y: 0.85) // Shrink entire button
        }) { _ in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [.allowUserInteraction], animations: {
                button.transform = CGAffineTransform.identity // Restore original size
            }) { _ in
                completion()
            }
        }
    }
    
    // MARK: - Pop or Dismiss ViewController
    func navigateBack(animated: Bool = true, completion: @escaping () -> Void = {}) {
        if let nav = self.navigationController, nav.viewControllers.count > 1 {
            nav.popViewController(animated: animated)
            completion()
        } else {
            self.dismiss(animated: animated, completion: completion)
        }
    }
    
    // MARK: - Button Handlers
    @objc func handleBack(_ sender: UIButton, animated: Bool = true) {
        animateButton(sender) {
            self.navigateBack(animated: animated)
        }
    }
    
    @objc func handleProfile(_ sender: UIButton) {
        animateButton(sender) {
            print("👤 Profile button tapped.")
        }
    }
}
