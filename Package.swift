// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "swift-macro-testing",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6),
  ],
  products: [
    .library(
      name: "MacroTesting",
      targets: ["MacroTesting"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/ContentsToolDev/swift-syntax-xcframeworks", branch: "main"),
    .package(url: "https://github.com/ContentsToolDev/swift-snapshot-testing", branch: "main"),
  ],
  targets: [
    .target(
      name: "MacroTesting",
      dependencies: [
        .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
        .product(name: "SwiftSyntaxWrapper", package: "swift-syntax-xcframeworks"),
      ]
    ),
    .testTarget(
      name: "MacroTestingTests",
      dependencies: [
        "MacroTesting"
      ]
    ),
  ]
)
