// swift-tools-version:5.4
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
        .package(url: "https://github.com/SwiftRex/SwiftRex.git", .upToNextMajor(from: "0.8.8"))
    ],
    targets: [
        .target(name: "SwiftRexDSL", dependencies: [.product(name: "CombineRex", package: "SwiftRex")]),
        .testTarget(name: "SwiftRexDSLTests", dependencies: ["SwiftRexDSL"])
    ]
)
