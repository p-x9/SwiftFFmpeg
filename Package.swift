// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftFFmpeg",
    platforms: [.iOS(.v9),.tvOS(.v10),.macOS(.v10_10)],
    products: [
        .library(
            name: "SwiftFFmpeg",
            targets: ["SwiftFFmpeg"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftFFmpeg",
            dependencies: ["CFFmpeg"]
        ),
        .target(
            name: "CFFmpeg",
            dependencies: [
                "avcodec",
                "avdevice",
                "avfilter",
                "avformat",
                "avutil",
                "swresample",
                "swscale",
            ],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("lzma"),
                .linkedFramework("Security"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("VideoToolbox"),
                .linkedFramework("CoreImage"),
                .linkedFramework("AVFoundation"),
            ]
        ),
        .binaryTarget(name: "avcodec", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avcodec.xcframework.zip?raw=true", checksum: "52d3420b9a9d9cade5f003a76a0d9ae689124b14defc2973f80ac80c8e3c0225"),
        .binaryTarget(name: "avutil", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avutil.xcframework.zip?raw=true", checksum: "6046e340ce6e6b9b81407af08a5e2ac1583867c4ac57ba9de5d6663e8115c7d7"),
        .binaryTarget(name: "avformat", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avformat.xcframework.zip?raw=true", checksum: "14620fd17738270d76b6209286ab053a3fdeaa11d7a59301e89b0db8983e71d7"),
        .binaryTarget(name: "avfilter", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avfilter.xcframework.zip?raw=true", checksum: "b3ae30eaeb987d80a7694b02d923c52d86b30f4e6b62d230f7ea442d112dfc4e"),
        .binaryTarget(name: "avdevice", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avdevice.xcframework.zip?raw=true", checksum: "df2dfd2fbbd0316fce428eba6311521772b810293a5bca8b67c56353fc4a18a8"),
        .binaryTarget(name: "swscale", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/swscale.xcframework.zip?raw=true", checksum: "b129547c15c1f584b093e6d26cb173ad4d259ef1be42f0eb9860d4b4ce629460"),
        .binaryTarget(name: "swresample", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/swresample.xcframework.zip?raw=true", checksum: "54425a20156c48ebc9d86e89c55e3f2ece1a23a377079ac88ad99f5691795228"),
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
