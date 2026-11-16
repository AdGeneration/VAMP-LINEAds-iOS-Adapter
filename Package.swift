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
        .package(
            url: "https://github.com/ly-ads-network/swift-package-manager-fivead.git",
            exact: "3.1.2"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPLINEAdsAdapterTarget",
            dependencies: [
                .target(name: "VAMPLINEAdsAdapter"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
                .product(name: "FiveAd", package: "swift-package-manager-fivead"),
            ],
            path: "VAMPLINEAdsAdapterTarget"
        ),
        .binaryTarget(
            name: "VAMPLINEAdsAdapter",
            url: "https://github.com/AdGeneration/VAMP-LINEAds-iOS-Adapter/releases/download/3.1.200/VAMPLINEAdsAdapter-v3.1.200.zip",
            checksum: "1a679127883308c84fb23888834903fcf1425fb529eb6ea7f4692efc5f906d0e"
        )
    ]
)