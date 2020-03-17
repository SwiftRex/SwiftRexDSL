// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftRexDSL",
    platforms: [
        .iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(name: "SwiftRexDSL", targets: ["SwiftRexDSL"])
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftRex/SwiftRex.git", from: "0.7.0")
    ],
    targets: [
        .target(name: "SwiftRexDSL", dependencies: ["CombineRex"]),
        .testTarget(name: "SwiftRexDSLTests", dependencies: ["SwiftRexDSL"])
    ]
)
