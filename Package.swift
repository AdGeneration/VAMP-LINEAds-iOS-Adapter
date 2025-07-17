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
        .library(
            name: "FiveAd",
            targets: ["FiveAd"])
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
        ),
        .binaryTarget(
            name: "FiveAd",
            url: "https://cdn.fivecdm.com/release-sdk/ios/20250507/FiveAd.framework-20250507.zip",
            checksum: "c266217c4f08e4d3b4160b3720b3bbfb3d536f04012e1a81cb4cb1c3ad2dae59"
        )
    ]
)