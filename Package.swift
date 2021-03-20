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
        .binaryTarget(name: "avcodec", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avcodec.zip?raw=true", checksum: "8ce3195a7d5707a9cd458a7c8d8eb6841c5cba14c05c7b01e17637de8d781428"),
        .binaryTarget(name: "avutil", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avutil.zip?raw=true", checksum: "a0f84a1a9414e7f2bb41719a108b039387da7bb0c6fa07febc232f3e1012ed71"),
        .binaryTarget(name: "avformat", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avformat.zip?raw=true", checksum: "9550d4b9f90fa36989b6b504daeb78662f3aead7803a8ba91ceab1f10c8f2f67"),
        .binaryTarget(name: "avfilter", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avfilter.zip?raw=true", checksum: "46e4312759dbc3cf636462cb9848a59ade0f4ce7cebd95019863e59f3b820ca8"),
        .binaryTarget(name: "avdevice", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/avdevice.zip?raw=true", checksum: "372de39610dc32afd170e35373446b34d3939a634ac2818ff1372f7d6fec19ed"),
        .binaryTarget(name: "swscale", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/swscale.zip?raw=true", checksum: "ff2f7749eed0bb092877f9edc62701c30a29da1eb8b9122549b2ccab18b06f28"),
        .binaryTarget(name: "swresample", url: "https://github.com/p-x9/SwiftFFmpeg/blob/master_px/xcframework/swresample.zip?raw=true", checksum: "1918289b27469a407b02cc86913ad2950b794b85e6f1332749a2d7817f2a3e62"),
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
