// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Swerkin",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Swerkin",
            targets: ["Swerkin", "SwerkinAdditions"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/kif-framework/KIF.git", .exact("3.11.3"))],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwerkinAdditions",
            dependencies: [],
            path: "Sources",
            exclude: ["Swerkin", "../Example"],
            publicHeadersPath: ".",
            cSettings: [
                    .headerSearchPath(".")
                ]
            ),
        .target(
            name: "Swerkin",
            dependencies: ["KIF","SwerkinAdditions"],
            path: "Sources",
            exclude: ["SwerkinAdditions", "../Example"])
    ],
    swiftLanguageVersions: [.v5]
)
