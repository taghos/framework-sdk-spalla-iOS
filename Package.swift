// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpallaSDK",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SpallaSDK",
            targets: ["SpallaSDK", "SpallaFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/THEOplayer/theoplayer-sdk-apple.git", .upToNextMajor(from: "10.8.0")),
        .package(url: "https://github.com/SRGSSR/google-cast-sdk.git", .upToNextMajor(from: "4.8.3")),
        .package(url: "https://github.com/httpswift/swifter.git", .upToNextMajor(from: "1.5.0")),
        .package(url: "https://github.com/googleads/swift-package-manager-google-interactive-media-ads-ios.git", .upToNextMajor(from: "3.24.0"))

    ],
    targets: [
        .target(
            name: "SpallaSDK",
            dependencies: [
                .product(name: "THEOplayerSDK", package: "theoplayer-sdk-apple"),
                .product(name: "THEOplayerGoogleCastIntegration", package: "theoplayer-sdk-apple"),
                .product(name: "THEOplayerGoogleIMAIntegration", package: "theoplayer-sdk-apple"),
                .product(name: "GoogleCast", package: "google-cast-sdk"),
                .product(name: "Swifter", package: "swifter"),
                .product(name: "GoogleInteractiveMediaAds", package: "swift-package-manager-google-interactive-media-ads-ios")

            ],
            path: "Sources"
            
        ),
        .binaryTarget(
          name: "SpallaFramework",
          path: "SpallaSDK.xcframework"
        ),
    ]
)
