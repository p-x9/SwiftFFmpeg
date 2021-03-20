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
            ]
        ),
        .binaryTarget(name: "avcodec", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avcodec.zip?raw=true", checksum: "9862e1304ad4dc5d70f5b346c29e6dfdde9142a9b6880351b9606dc57f4440da"),
        .binaryTarget(name: "avutil", url: "https://github.com/sunlubo/SwiftFFmpeg/blob/master_px/xcframework/avutil.zip?raw=true", checksum: "31de823d0c1cc3430d34d491dad706e89dd7a7df277256e87ace412e1af26ab8"),
        .binaryTarget(name: "avformat", url: "https://github.com/sunlubo/SwiftFFmpeg/blob/master_px/xcframework/avformat.zip?raw=true", checksum: "c8bc873fc1d1caa9812a80f7e4ae7a7370a420cba24094daaf61dede15eb109c"),
        .binaryTarget(name: "avfilter", url: "https://github.com/sunlubo/SwiftFFmpeg/blob/master_px/xcframework/avfilter.zip?raw=true", checksum: "c1f1489d0e00a62666f2b59e03fc59b7d1aa18c900468e1177c97c5474a8cd6c"),
        .binaryTarget(name: "avdevice", url: "https://github.com/sunlubo/SwiftFFmpeg/blob/master_px/xcframework/avdevice.zip?raw=true", checksum: "aa5f764d0ab1616c9c03f497a3476cf69685d4edd07b9ab88e1890de8622f16f"),
        .binaryTarget(name: "swscale", url: "https://github.com/sunlubo/SwiftFFmpeg/blob/master_px/xcframework/swscale.zip?raw=true", checksum: "221dc859e17671daed6c645b10c877c11579ce9491f50d66302ac0f3bbc4f02e"),
        .binaryTarget(name: "swresample", url: "https://github.com/sunlubo/SwiftFFmpeg/blob/master_px/xcframework/swresample.zip?raw=true", checksum: "7d4274ec462e1edbd9dcf6de3e9a30777c3c1efba8e60106e81f2de6dd9a39f5"),
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
