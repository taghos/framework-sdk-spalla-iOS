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
    dependencies: [],
    targets: [
        .target(
            name: "SpallaSDK",
            path: "Sources"
        ),
        .binaryTarget(
          name: "SpallaFramework",
          path: "SpallaSDK.xcframework"
        )
    ]
)
