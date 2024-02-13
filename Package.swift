// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plato",
    platforms: [.macOS(.v11), .iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Plato",
            targets: ["Plato"])
    ],
    dependencies: [
        .package(url: "https://github.com/antlr/antlr4", .upToNextMajor(from: "4.13.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Plato",
            dependencies: ["PlatoCore"]
        ),
        .target(
            name: "PlatoCore",
            dependencies: [
                .product(name: "Antlr4", package: "antlr4")
            ]
        ),
        .testTarget(
            name: "PlatoTests",
            dependencies: [
                "Plato",
                "PlatoCore",
                .product(name: "Antlr4", package: "antlr4")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
