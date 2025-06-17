// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpallaSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SpallaSDK",
            targets: ["SpallaSDK", "SpallaFramework"])
    ],
    dependencies: [
        .package(url: "https://github.com/THEOplayer/theoplayer-sdk-apple.git", .upToNextMajor(from: "9.5.1")),
        .package(url: "https://github.com/SRGSSR/google-cast-sdk.git", .upToNextMajor(from: "4.8.3"))
    ],
    targets: [
        .target(
            name: "SpallaSDK",
            dependencies: [
                .product(name: "THEOplayerSDK", package: "theoplayer-sdk-apple"),
                .product(name: "THEOplayerGoogleCastIntegration", package: "theoplayer-sdk-apple"),
                .product(name: "GoogleCast", package: "google-cast-sdk")
            ],
            path: "Sources"
            
        ),
        .binaryTarget(
          name: "SpallaFramework",
          path: "SpallaSDK.xcframework"
        ),
    ]
)
