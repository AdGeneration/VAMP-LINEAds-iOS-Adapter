// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-LINEAds-iOS-Adapter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VAMPLINEAdsAdapter",
            targets: ["VAMPLINEAdsAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/VAMP-iOS-SDK",
            "5.3.2"..<"6.0.0"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPLINEAdsAdapterTarget",
            dependencies: [
                .target(name: "VAMPLINEAdsAdapter"),
                .target(name: "FiveAd"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
            ],
            path: "VAMPLINEAdsAdapterTarget"
        ),
        .binaryTarget(
            name: "VAMPLINEAdsAdapter",
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPLINEAdsAdapter-v2.9.2025050700.zip",
            checksum: "3b34a3aa4dba1b4d07c925e840d2494be248c66a5f7924f8e3fcec94c98d8aae"
        ), // 修正点: カンマを追加
        .binaryTarget(
            // 修正点: 命名をFiveAdに統一
            name: "FiveAd",
            url: "https://cdn.fivecdm.com/release-sdk/ios/20250512/FiveAd.framework-20250512.zip",
            checksum: "9a7f3d9954db10657de426981d4f2b9a6d43cdb96b686c14acd23f20c31f879f"
        )
    ]
)