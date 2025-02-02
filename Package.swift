// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "NavLib",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "NavLib",
            targets: ["NavLib"]
        )
    ],
    targets: [
        .target(
            name: "NavLib",
            dependencies: []
        ),
        .testTarget(
            name: "NavLibTests",
            dependencies: ["NavLib"]
        )
    ]
)
