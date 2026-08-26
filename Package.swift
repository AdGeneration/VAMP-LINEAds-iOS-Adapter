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
            exact: "3.1.0"
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
            url: "https://github.com/AdGeneration/VAMP-LINEAds-iOS-Adapter/releases/download/3.1.0/VAMPLINEAdsAdapter-v3.1.0.zip",
            checksum: "1d29c3d0c49eed255e19ec204615a4fadd9371aa6b44fec9872db40345429dae"
        )
    ]
)