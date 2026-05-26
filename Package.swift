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
            exact: "3.0.1"
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
            url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPLINEAdsAdapter-v3.0.100.zip",
            checksum: "82d298eee5093f5c72a03efd149aa3bd31e70f4299c3157ea4804617bcc044e7"
        )
    ]
)