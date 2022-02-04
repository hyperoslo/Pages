// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Pages",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "Pages",
            targets: ["Pages"]
        ),
    ],
    targets: [
        .target(
            name: "Pages",
            path: "Source"
        )
    ]
)
