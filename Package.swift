// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "WUEnvironment",
    products: [
        .library(
            name: "WUEnvironment",
            targets: ["WUEnvironment"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WUEnvironment",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "WUEnvironmentTests",
            dependencies: ["WUEnvironment"],
            path: "Tests"
        ),
    ]
)
