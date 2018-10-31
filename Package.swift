// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "storyboard2code",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0"),
        .package(url: "https://github.com/watanabetoshinori/XMLParsing.git", from: "0.0.4"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", from: "2.7.1"),
        .package(url: "https://github.com/watanabetoshinori/StoryboardModel.git", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "storyboard2code",
            dependencies: ["Commander", "XMLParsing", "StencilSwiftKit", "StoryboardModel"]),
    ]
)
