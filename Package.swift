// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFFmpeg",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "SwiftFFmpeg",
            targets: ["SwiftFFmpeg"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/FFmpeg-iOS.git", from: "0.0.2"),
    ],
    targets: [
        .systemLibrary(
            name: "CFFmpeg",
            pkgConfig: "libavformat"
        ),
        .target(
            name: "SwiftFFmpeg",
            dependencies: ["CFFmpeg"]
        ),
        .target(
            name: "SwiftFFmpegExamples",
            dependencies: ["SwiftFFmpeg"]
        ),
        .testTarget(
            name: "SwiftFFmpegTests",
            dependencies: ["SwiftFFmpeg"]
        ),
    ]
)
