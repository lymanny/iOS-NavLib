import XCTest
@testable import NavLib

final class NavLibTests: XCTestCase {
    
    func testSetNavigationBarStyleWeBill() throws {
        // Arrange
        let viewController = UIViewController()
        let navigationController = UINavigationController(rootViewController: viewController) // Embed in UINavigationController
        
        let titleConfig = NavigationTitleConfig(
            title: "Test Title",
            titleFontName: "System",
            titleFontSize: 18,
            titleFontWeight: .bold,
            titleColor: .black
        )
        let subtitleConfig = NavigationSubtitleConfig(
            subtitle: "Test Subtitle",
            subtitleFontSize: 14,
            subtitleColor: .gray
        )
        let leftButton = NavigationButtonConfig(
            titleConfig: ButtonTitleConfig(title: "Back"),
            selector: #selector(viewController.handleBack)
        )
        let rightButton = NavigationButtonConfig(
            titleConfig: ButtonTitleConfig(title: "Done"),
            selector: nil
        )
        
        // Act
        viewController.setNavigationBarStyleWeBill(
            isHidden: false,
            barTintColor: .white,
            titleConfig: titleConfig,
            subtitleConfig: subtitleConfig,
            leftButtons: [leftButton],
            rightButtons: [rightButton],
            titleSubtitleSpacing: 5,
            btnLeftRightSpacing: 10
        )
        
        // Assert
        XCTAssertFalse(navigationController.isNavigationBarHidden, "The navigation bar should be visible.")
        XCTAssertNotNil(viewController.navigationItem.titleView, "The title view should not be nil.")
        
        if let titleStackView = viewController.navigationItem.titleView as? UIStackView {
            XCTAssertEqual(titleStackView.arrangedSubviews.count, 2, "The title view should contain a title and a subtitle.")
        } else {
            XCTFail("The title view is not a UIStackView or is nil.")
        }
    }
}
