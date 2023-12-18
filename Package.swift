// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpallaSDK",
    products: [
        .library(
            name: "SpallaSDK",
            targets: ["SpallaSDK", "SpallaFramework", "TheoSDK"])
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", .upToNextMajor(from: "3.18.5")),
    ],
    targets: [
        .target(
            name: "SpallaSDK",
            path: "Sources"
        ),
        .binaryTarget(
          name: "SpallaFramework",
          path: "SpallaSDK.xcframework"
        ),
        .binaryTarget(
            name: "TheoSDK",
            path: "THEOplayerSDK.xcframework"
        )
    ]
)
