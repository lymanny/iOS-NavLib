# 🚀 iOS-NavLib

A **lightweight and customizable navigation bar library** for UIKit, designed to simplify and enhance navigation bar configurations with **titles, subtitles, buttons, animations, and spacing controls**.

---

## 📋 Requirements

- **iOS 15.0+**
- **Xcode 12+**

---

## ✨ Features

- 🔹 **Custom Titles & Subtitles** with adjustable spacing
- 🔹 **Dynamic Left & Right Buttons** (supports images and text)
- 🔹 **Title with Image Support** (custom positioning, adjustable size & padding)
- 🔹 **Customizable Spacing** for title, subtitle, and buttons
- 🔹 **Navigation Bar Customization**:
  - 🔹 `isHidden` → Show or hide the navigation bar
  - 🔹 `barTintColor` → Set the background color
  - 🔹 `titleConfig` → Configure title text, font, size, color, and image
  - 🔹 `subtitleConfig` → Add an optional subtitle with styling options
  - 🔹 `leftButtons` → Add buttons on the left side of the navigation bar
  - 🔹 `rightButtons` → Add buttons on the right side of the navigation bar
  - 🔹 `titleSubtitleSpacing` → Adjust the spacing between title and subtitle
  - 🔹 `btnLeftRightSpacing` → Customize spacing between buttons

---

## 🖼 Screenshot

Here’s an example of **iOS-NavLib**:

![Custom Navigation Bar](https://github.com/user-attachments/assets/b764b4a0-a27a-4103-ac6d-b26cea745803)

---

## 📦 Installation

### **Swift Package Manager (SPM)**

To add **iOS-NavLib** via **Swift Package Manager**, follow these steps:

1. In Xcode, go to File > Add Packages.
2. Enter the repository URL:
   ```
   https://github.com/lymanny/iOS-NavLib.git
   ```
3. Select the latest version and add it to your project.

---

## 🛠️ Usage

Make sure to import the library:

```swift
import NavLib
```

### Configure Navigation Bar

```swift
setNavigationBarStyle(
    isHidden: false, // Show navigation bar
    barTintColor: UIColor.cyan, // Background color
    titleConfig: NavigationTitleConfig(
        title: "Cart View", // Set title
        titleImage: UIImage(named: "icon"), // Title image
        titleImageSize: CGSize(width: 18, height: 16), // Custom title image size
        titleFontName: "System", // Font name
        titleFontSize: 16, // Font size
        titleFontWeight: .semibold, // Font weight
        titleColor: .black, // Title color
        titleImageDirection: .trailing, // Image position
        titleImagePadding: 4, // Space between text and image
        titleSelector: #selector(handleTitleTap) // Title tap action
    ),
    subtitleConfig: NavigationSubtitleConfig(
        subtitle: "Items", // Subtitle text
        subtitleFontName: "System", // Subtitle font
        subtitleFontSize: 12, // Subtitle font size
        subtitleFontWeight: .regular, // Font weight
        subtitleColor: .gray // Subtitle color
    ),
    leftButtons: [
        NavigationButtonConfig(image: UIImage(named: "back"), selector: #selector(handleBack)) // Back button
    ],
    rightButtons: [
        NavigationButtonConfig(image: UIImage(named: "plus"), selector: #selector(handleAddItem)), // Plus button
        NavigationButtonConfig(titleConfig: ButtonTitleConfig(
            title: "Checkout", // Button title
            titleFontName: "System", // Font name
            titleFontSize: 16, // Font size
            titleFontWeight: .medium, // Font weight
            titleColor: .systemBlue // Font color
        ), selector: #selector(handleCheckout)) // Checkout button
    ],
    titleSubtitleSpacing: 0, // No space between title & subtitle
    btnLeftRightSpacing: 10 // Space between buttons
)
```

---

## 📌 Known Issue

### 📈 **Navigation Bar Not Showing When Presenting a View Controller**

When presenting a view controller using `present()`, the navigation bar **does not appear** by default.

### **Solution:**
Wrap the presented view controller inside a `UINavigationController`:
```swift
@objc func presentCartView() {
    let cartVC = CartViewVC()
    let navController = UINavigationController(rootViewController: cartVC)
    navController.modalPresentationStyle = .fullScreen // Optional: Present full screen
    present(navController, animated: true, completion: nil)
}
```

Now, `setNavigationBarStyle()` will work properly in `CartViewVC`.

---

## 📄 License & Credits

This project is licensed under the **MIT License**.

The `setNavigationBarStyle` function was originally developed by **KOSIGN iOS Developers**.  
I have modified and enhanced it with additional features, including:

- 🔹 **Title Configuration** (supports title images, spacing, and customization)
- 🔹 **Subtitle Configuration** (adjustable font, color, and size)
- 🔹 **Left & Right Button Customization** (image/text-based buttons)
- 🔹 **Title-Subtitle Spacing Control** (`titleSubtitleSpacing`)
- 🔹 **Custom Button Spacing** (`btnLeftRightSpacing`)

See the **[License](LICENSE)** file for more details.

---

## 🎯 Contributions & Feedback

Feel free to **fork, improve, and submit pull requests!**  
For issues & feature requests, open a **GitHub issue**.

---

🚀 **Enjoy iOS-NavLib!** 😊
