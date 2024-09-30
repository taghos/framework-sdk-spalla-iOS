// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpallaSDK",
    products: [
        .library(
            name: "SpallaSDK",
            targets: ["SpallaSDK", "SpallaFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", .upToNextMajor(from: "3.23.0")),
    ],
    targets: [
        .target(
            name: "SpallaSDK",
            dependencies: [
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios"),
                "TheoSDK",
                "GoogleCast"
            ],
            path: "Sources"
            
        ),
        .binaryTarget(
          name: "SpallaFramework",
          path: "SpallaSDK.xcframework"
        ),
        .binaryTarget(
            name: "TheoSDK",
            path: "THEOplayerSDK.xcframework"
        ),
        .binaryTarget(
            name: "GoogleCast",
            path: "GoogleCast.xcframework"
        )
    ]
)
